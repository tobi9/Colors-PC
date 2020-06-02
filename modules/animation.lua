-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

M.BUTTON_ANIMATION_DURATION = 0.05

function M.touch_feedback(node, hdl)
	local pos = gui.get_position(node)
	gui.animate(node, "position.x", pos.x + 10, gui.EASING_INOUTBOUNCE, M.BUTTON_ANIMATION_DURATION, 0, hdl, gui.PLAYBACK_ONCE_PINGPONG)
end

return M
