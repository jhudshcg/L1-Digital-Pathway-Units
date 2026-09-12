--[[
  layouts.lua
  Pandoc Lua filter using clean, native Pandoc AST transformations.
  Applies custom-style="TableGrid" to all tables so Word links to the TableGrid style in booklet_template.docx.
  Location: Units/layouts/layouts.lua
]]

-- Global metadata captured from YAML header
local doc_meta = {}

-- Helper: wrap list of blocks in cell contents (returns list of blocks)
local function make_cell(blocks)
  blocks = blocks or {}
  if #blocks == 0 then
    return { pandoc.Para({}) }
  end
  return blocks
end

function Meta(meta)
  if pandoc.utils.stringify(meta['cover-layout'] or '') == 'png' then
    -- DOCX emits title/subtitle outside the AST. Use Subject for the running
    -- header and render the visible cover solely through layout-cover.
    meta.subject = meta.title
    meta.title = nil
    meta.subtitle = nil
  end
  doc_meta = meta
  return meta
end

-- Estimate empty paragraphs for default 5-line height
local function height_to_blank_paras(height_str)
  if not height_str then return 5 end
  local num = tonumber(height_str:match("([%d%.]+)"))
  if not num then return 5 end
  -- EvidenceSpace in the reference template uses 20pt lines. Convert cm to lines.
  return math.max(1, math.ceil(num * 28.3465 / 20))
end

-- 1. LAYOUT: Textbox / Response Box / Evidence Box
local function render_textbox(elem)
  local title = elem.attributes['title'] or elem.attributes['prompt']
  local height_str = elem.attributes['height']
  local content = elem.content

  -- Preserve helper content and reserve space independently of its presence.
  -- Visual styling is defined by EvidenceHint / EvidenceSpace in the template.
  local padded = {}
  if #content > 0 then
    table.insert(padded, pandoc.Div(content, pandoc.Attr("", {}, {["custom-style"]="EvidenceHint"})))
  end
  local blank_count = height_to_blank_paras(height_str)
  for _ = 1, blank_count do
    table.insert(padded, pandoc.Div({pandoc.Para({pandoc.Str(" ")})},
      pandoc.Attr("", {}, {["custom-style"]="EvidenceSpace"})))
  end
  content = padded

  local rows = {}

  if title and title ~= "" then
    local title_cell = make_cell({ pandoc.Para({ pandoc.Strong({ pandoc.Str(title) }) }) })
    table.insert(rows, { title_cell })
  end

  local content_cell = make_cell(content)
  table.insert(rows, { content_cell })

  local simple = pandoc.SimpleTable(
    {},
    { pandoc.AlignLeft },
    { 1.0 },
    {},
    rows
  )

  local tbl = pandoc.utils.from_simple_table(simple)
  tbl.attributes['custom-style'] = 'TableGrid'
  return tbl
end

-- 2. LAYOUT: Unit Header Top Banner
local function render_unit_header(elem)
  local unit_title = elem.attributes['unit-title'] or "Design Software"
  local unit_code = elem.attributes['unit-code'] or "R/505/6389"
  local credits = elem.attributes['credits'] or "3 Credits"
  local project = elem.attributes['project'] or "Student Project"

  local left_cell = make_cell({
    pandoc.Para({
      pandoc.Strong({ pandoc.Str("Unit: ") }),
      pandoc.Str(unit_title),
      pandoc.LineBreak(),
      pandoc.Strong({ pandoc.Str("Unit Code: ") }),
      pandoc.Str(unit_code)
    })
  })

  local right_cell = make_cell({
    pandoc.Para({
      pandoc.Strong({ pandoc.Str("Credit Value: ") }),
      pandoc.Str(credits),
      pandoc.LineBreak(),
      pandoc.Strong({ pandoc.Str("Project: ") }),
      pandoc.Str(project)
    })
  })

  local simple = pandoc.SimpleTable(
    {},
    { pandoc.AlignLeft, pandoc.AlignRight },
    { 0.55, 0.45 },
    {},
    { { left_cell, right_cell } }
  )

  local tbl = pandoc.utils.from_simple_table(simple)
  tbl.attributes['custom-style'] = 'TableGrid'
  return tbl
end

-- 3. LAYOUT: Student Declaration Box
local function render_declaration(elem)
  local body_cell = make_cell(elem.content)

  local simple = pandoc.SimpleTable(
    {},
    { pandoc.AlignLeft },
    { 1.0 },
    {},
    {
      { body_cell }
    }
  )

  local tbl = pandoc.utils.from_simple_table(simple)
  tbl.attributes['custom-style'] = 'TableGrid'
  return tbl
end

-- 4. LAYOUT: 5-textbox-cross (Concept Map / Moodboard)
local function render_5_textbox_cross(elem)
  local slots = { tl = {}, tr = {}, center = {}, bl = {}, br = {} }

  for _, block in ipairs(elem.content) do
    if block.t == "Div" then
      if block.classes:includes("tl") or block.classes:includes("top-left") then
        slots.tl = block.content
      elseif block.classes:includes("tr") or block.classes:includes("top-right") then
        slots.tr = block.content
      elseif block.classes:includes("center") or block.classes:includes("centre") then
        slots.center = block.content
      elseif block.classes:includes("bl") or block.classes:includes("bottom-left") then
        slots.bl = block.content
      elseif block.classes:includes("br") or block.classes:includes("bottom-right") then
        slots.br = block.content
      end
    end
  end

  local empty_cell = make_cell({})

  local rows = {
    { make_cell(slots.tl), empty_cell, make_cell(slots.tr) },
    { empty_cell, make_cell(slots.center), empty_cell },
    { make_cell(slots.bl), empty_cell, make_cell(slots.br) }
  }

  local simple = pandoc.SimpleTable(
    {},
    { pandoc.AlignLeft, pandoc.AlignCenter, pandoc.AlignLeft },
    { 0.38, 0.24, 0.38 },
    {},
    rows
  )

  local tbl = pandoc.utils.from_simple_table(simple)
  tbl.attributes['custom-style'] = 'TableGrid'
  return tbl
end

-- 5. LAYOUT: Metadata Form Table (Front Cover / Info)
local function render_metadata_table_div(elem)
  for _, item in ipairs(elem.content) do
    if item.t == "Table" then
      item.attributes['custom-style'] = 'TableGrid'
      item.colspecs = {
        { pandoc.AlignLeft, 0.35 },
        { pandoc.AlignLeft, 0.65 }
      }
      return item
    end
  end
  return elem
end

-- Apply the template's smaller paragraph style only inside the marked table.
local function render_assessment_criteria(elem)
  local function style_paragraph(block)
    return pandoc.Div({pandoc.Para(block.content)},
      pandoc.Attr('', {}, {['custom-style']='AssessmentCriteria'}))
  end
  return elem:walk({Para=style_paragraph, Plain=style_paragraph}).content
end

-- Main Div Dispatcher
function Div(elem)
  if elem.classes:includes('layout-assessment-criteria') then
    return render_assessment_criteria(elem)
  end

  local cover_styles = {
    ['cover-name']='CoverName', ['cover-qualification']='CoverQualification',
    ['cover-code']='CoverCode', ['cover-title']='CoverUnitTitle',
    ['cover-artwork']='CoverArtwork'
  }
  for class, style in pairs(cover_styles) do
    if elem.classes:includes(class) then
      local blocks = {}
      for _, block in ipairs(elem.content) do
        if block.t == 'Header' then block = pandoc.Para(block.content) end
        table.insert(blocks, block)
      end
      return pandoc.Div(blocks, pandoc.Attr('', {}, {['custom-style']=style}))
    end
  end
  if elem.classes:includes('layout-cover') then
    local simple = pandoc.SimpleTable({}, {pandoc.AlignDefault}, {1.0}, {}, {{make_cell(elem.content)}})
    local tbl = pandoc.utils.from_simple_table(simple)
    tbl.attributes['custom-style'] = 'CoverFrame'
    return tbl
  end

  -- Response / Text / Evidence box
  if elem.classes:includes("layout-textbox") or
     elem.classes:includes("layout-response-box") or
     elem.classes:includes("layout-evidence-box") or
     elem.classes:includes("layout-box") or
     elem.classes:includes("AnswerBox") or
     elem.attributes['custom-style'] == "AnswerBox" then
    return render_textbox(elem)
  end

  -- Unit header banner
  if elem.classes:includes("layout-unit-header") then
    return render_unit_header(elem)
  end

  -- Student authenticity declaration box
  if elem.classes:includes("layout-declaration") or
     elem.classes:includes("layout-declaration-box") or
     elem.classes:includes("declaration-box") then
    return render_declaration(elem)
  end

  -- PNG cover variation: one header row and one blank data row.
  if elem.classes:includes("layout-cover-dates") then
    for _, item in ipairs(elem.content) do
      if item.t == "Table" then
        item.attributes['custom-style'] = 'CoverDates'
        item.colspecs = {
          {pandoc.AlignCenter, 0.15}, {pandoc.AlignCenter, 0.18},
          {pandoc.AlignCenter, 0.18}, {pandoc.AlignCenter, 0.49}
        }
        return item
      end
    end
  end

  -- Metadata table wrapper
  if elem.classes:includes("layout-metadata-table") or
     elem.classes:includes("layout-form-table") or
     elem.classes:includes("layout-info-table") then
    return render_metadata_table_div(elem)
  end

  -- 5-textbox-cross
  if elem.classes:includes("layout-5-textbox-cross") or
     elem.classes:includes("5-textbox-cross") then
    return render_5_textbox_cross(elem)
  end

  -- Native page break
  if elem.classes:includes("page-break") or
     elem.classes:includes("layout-page-break") then
    return pandoc.RawBlock('openxml', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>')
  end

  return elem
end

-- Table Dispatcher: ensure ALL standard markdown tables receive the TableGrid style
function Table(tbl)
  if not tbl.attributes['custom-style'] then tbl.attributes['custom-style'] = 'TableGrid' end
  return tbl
end

-- Header Dispatcher: Shift body headers down by 1 so Markdown ## becomes Word's Heading 1,
-- ### becomes Heading 2, and #### becomes Heading 3.
-- Cover title styling is handled by its cover-title Div.
function Header(el)
  if el.level == 1 then
    -- Cover divs map this label to CoverUnitTitle; body headings shift below.
    return el
  elseif el.level > 1 then
    el.level = el.level - 1
    return el
  end
  return el
end
