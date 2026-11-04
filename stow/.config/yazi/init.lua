require("yaziline"):setup()
require("what-size"):setup({
    priority = 400,
    LEFT = "",
    RIGHT = " ",
})

function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	else
		time = os.date("%Y %b%d  %R", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
