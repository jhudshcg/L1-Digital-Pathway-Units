--[[
  layouts.lua
  Pandoc Lua filter using clean, native Pandoc AST transformations.
  Applies custom-style="TableGrid" to all tables so Word links to the TableGrid style in booklet_template.docx.
  Location: Units/layouts/layouts.lua
]]

-- Helper: wrap list of blocks in cell contents (returns list of blocks)
local function make_cell(blocks)
  blocks = blocks or {}
  if #blocks == 0 then
    return { pandoc.Para({}) }
  end
  return blocks
end

-- Estimate empty paragraphs for default 5-line height
local function height_to_blank_paras(height_str)
  if not height_str then return 5 end
  local num = tonumber(height_str:match("([%d%.]+)"))
  if not num then return 5 end
  if num >= 7 then return 8 end
  if num >= 5 then return 6 end
  if num >= 3 then return 5 end
  return 3
end

-- 1. LAYOUT: Textbox / Response Box / Evidence Box
local function render_textbox(elem)
  local title = elem.attributes['title'] or elem.attributes['prompt']
  local height_str = elem.attributes['height']
  local content = elem.content

  if #content == 0 then
    local blank_count = height_to_blank_paras(height_str)
    content = {}
    for _ = 1, blank_count do
      table.insert(content, pandoc.Para({ pandoc.Str("") }))
    end
  end

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
  local header_cell = make_cell({
    pandoc.Para({ pandoc.Strong({ pandoc.Str("STUDENT DECLARATION OF AUTHENTICITY") }) })
  })

  local body_cell = make_cell(elem.content)

  local simple = pandoc.SimpleTable(
    {},
    { pandoc.AlignLeft },
    { 1.0 },
    {},
    {
      { header_cell },
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

-- Main Div Dispatcher
function Div(elem)
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
  tbl.attributes['custom-style'] = 'TableGrid'
  return tbl
end