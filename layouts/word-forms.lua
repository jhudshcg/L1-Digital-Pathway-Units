--[[
  word-forms.lua
  Word Form Content Controls (SDT) generators and Pandoc inline filter.
  Location: layouts/word-forms.lua

  CRITICAL OpenXML Word Form Rules (ECMA-376):
  1. DropDownList items MUST use tag <w:listItem w:displayText="..." w:value="..."/>
     - NEVER use <w:listEntry> or <w:val> for dropdown list items (Word will report corruption).
  2. Plain Text and Date Controls:
     - Text: <w:text/>
     - Date: <w:date><w:dateFormat w:val="dd/MM/yyyy"/><w:lid w:val="en-GB"/></w:date>
  3. Avoid Office 2010 extension tags (e.g. <w14:checkbox>) without w14 namespace declarations.
  4. NEVER put raw linefeeds (&#10; or \n) inside <w:t> elements.
]]

local M = {}

-- Helper to escape XML special characters
local function xml_escape(str)
  str = tostring(str or "")
  str = str:gsub("&", "&amp;")
  str = str:gsub("<", "&lt;")
  str = str:gsub(">", "&gt;")
  str = str:gsub('"', "&quot;")
  str = str:gsub("'", "&apos;")
  return str
end

--- Generate an OpenXML Plain Text Content Control (SDT)
function M.plain_text(alias, tag, placeholder, color)
  alias = xml_escape(alias or "Text Field")
  tag = xml_escape(tag or alias:gsub("%s+", ""))
  placeholder = xml_escape(placeholder or "Click or tap here to enter text...")
  color = xml_escape(color or "708090")

  return string.format(
    '<w:sdt><w:sdtPr><w:alias w:val="%s"/><w:tag w:val="%s"/><w:text/></w:sdtPr>' ..
    '<w:sdtContent><w:r><w:rPr><w:color w:val="%s"/><w:i/></w:rPr><w:t>%s</w:t></w:r></w:sdtContent></w:sdt>',
    alias, tag, color, placeholder
  )
end

--- Generate an OpenXML Date Picker Content Control (SDT)
function M.date_picker(alias, tag, placeholder, date_format, color)
  alias = xml_escape(alias or "Date Field")
  tag = xml_escape(tag or alias:gsub("%s+", ""))
  placeholder = xml_escape(placeholder or "Select date...")
  date_format = xml_escape(date_format or "dd/MM/yyyy")
  color = xml_escape(color or "708090")

  return string.format(
    '<w:sdt><w:sdtPr><w:alias w:val="%s"/><w:tag w:val="%s"/>' ..
    '<w:date><w:dateFormat w:val="%s"/><w:lid w:val="en-GB"/></w:date></w:sdtPr>' ..
    '<w:sdtContent><w:r><w:rPr><w:color w:val="%s"/><w:i/></w:rPr><w:t>%s</w:t></w:r></w:sdtContent></w:sdt>',
    alias, tag, date_format, color, placeholder
  )
end

--- Generate an OpenXML Drop-Down List Content Control (SDT)
-- @param entries Array of strings or tables { text = "...", val = "..." }
function M.drop_down(alias, tag, entries, placeholder, color)
  alias = xml_escape(alias or "Dropdown")
  tag = xml_escape(tag or alias:gsub("%s+", ""))
  placeholder = placeholder or (entries and entries[1]) or "Choose an item..."
  color = xml_escape(color or "708090")

  local items_xml = ""
  for _, entry in ipairs(entries or {}) do
    local text = type(entry) == "table" and entry.text or entry
    local val = type(entry) == "table" and (entry.val or entry.text) or entry
    items_xml = items_xml .. string.format(
      '<w:listItem w:displayText="%s" w:value="%s"/>',
      xml_escape(text), xml_escape(val)
    )
  end

  return string.format(
    '<w:sdt><w:sdtPr><w:alias w:val="%s"/><w:tag w:val="%s"/><w:dropDownList>%s</w:dropDownList></w:sdtPr>' ..
    '<w:sdtContent><w:r><w:rPr><w:color w:val="%s"/><w:i/></w:rPr><w:t>%s</w:t></w:r></w:sdtContent></w:sdt>',
    alias, tag, items_xml, color, xml_escape(placeholder)
  )
end

-- Pandoc Span Filter handler: allows concise Markdown spans like:
-- [Click to enter name...]{.form-text alias="Learner Name"}
-- [Select date...]{.form-date alias="Date Started"}
-- [Choose option...]{.form-dropdown alias="Audience" options="Beginners;General Public;Students"}
function Span(elem)
  if elem.classes:includes("form-text") then
    local alias = elem.attributes["alias"] or "Text"
    local tag = elem.attributes["tag"] or alias:gsub("%s+", "")
    local placeholder = pandoc.utils.stringify(elem.content)
    return pandoc.RawInline("openxml", M.plain_text(alias, tag, placeholder))
  end

  if elem.classes:includes("form-date") then
    local alias = elem.attributes["alias"] or "Date"
    local tag = elem.attributes["tag"] or alias:gsub("%s+", "")
    local placeholder = pandoc.utils.stringify(elem.content)
    local fmt = elem.attributes["format"] or "dd/MM/yyyy"
    return pandoc.RawInline("openxml", M.date_picker(alias, tag, placeholder, fmt))
  end

  if elem.classes:includes("form-dropdown") or elem.classes:includes("form-select") then
    local alias = elem.attributes["alias"] or "Select"
    local tag = elem.attributes["tag"] or alias:gsub("%s+", "")
    local placeholder = pandoc.utils.stringify(elem.content)
    local options_str = elem.attributes["options"] or ""
    local entries = {}
    for opt in string.gmatch(options_str, "([^;]+)") do
      table.insert(entries, opt)
    end
    return pandoc.RawInline("openxml", M.drop_down(alias, tag, entries, placeholder))
  end

  return elem
end

return M
