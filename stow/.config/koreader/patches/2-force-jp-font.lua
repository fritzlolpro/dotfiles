-- This patch will enable JP fonts, don't forget to add them
-- Register user fonts dir + force NotoSansJP as UI font
local DataStorage = require("datastorage")
local FontList = require("fontlist")
local Font = require("ui/font")
local logger = require("logger")
local lfs = require("libs/libkoreader-lfs")

local user_font_dir = DataStorage:getDataDir() .. "/fonts"
local JP_FONT = user_font_dir .. "/NotoSansJP-Regular.ttf"

-- 1. Scan the user fonts dir into FontList (same as getFontList
--    does for fontdir and external dirs)
if lfs.attributes(user_font_dir, "mode") == "directory" then
  FontList:_readList(user_font_dir, { cache_dirty = false })
  table.sort(FontList.fontlist)
  logger.warn("user-fonts patch: scanned", user_font_dir)
else
  logger.warn("user-fonts patch: no dir at", user_font_dir)
end

-- 2. Probe the font by absolute path before remapping
local probe = Font:getFace(JP_FONT, 20)
if not probe then
  logger.err("user-fonts patch: cannot load", JP_FONT)
  return
end

-- 3. Remap all logical UI fonts + add as first fallback
for k, _ in pairs(Font.fontmap) do
  Font.fontmap[k] = JP_FONT
end
table.insert(Font.fallbacks, 1, JP_FONT)
logger.warn("user-fonts patch: applied")
