-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

local BUTTON_ANIMATION_DURATION = 0.04

function M.touch_feedback(node, hdl)
	msg.post(main, "click")
	local pos = gui.get_position(node)
	gui.animate(node, "position.x", pos.x + 10, gui.EASING_INOUTBOUNCE, BUTTON_ANIMATION_DURATION, 0, hdl, gui.PLAYBACK_ONCE_PINGPONG)
end

local BOUNCE_DURATION = 0.6
function M.bounce_on_y_axis(id)
	local node = gui.get_node(id)
	local pos = gui.get_position(node)
	gui.animate(node , "position.y", pos.y + 5, gui.EASING_INBACK, BOUNCE_DURATION, 0, nil, gui.PLAYBACK_LOOP_PINGPONG)
end

function M.dance_on_x_axis(id)
	local node = gui.get_node(id)
	local pos = gui.get_position(node)
	gui.animate(node , "position.x", pos.x + 5, gui.EASING_INBACK, BOUNCE_DURATION, 0, nil, gui.PLAYBACK_LOOP_PINGPONG)
end

return M
