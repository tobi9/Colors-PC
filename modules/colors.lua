-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

--local folder = "Tc_debug"
--[[check if the lenght of the unlocked colors
M.check_len_of_unlkd_clrs = function()
	local file = sys.get_save_file(folder, "colors")
	local colors = sys.load(file)
    local counter = 0
	if #colors == 0 then
		return 5
	else
		for k, v in ipairs(colors) do
			--if v[2] == true then
				counter = counter + 1
			--end
        end
        return counter
	end	
end

--[[M.retrieve_colors = function()
	local file = sys.get_save_file(folder, "colors")
	local colors = sys.load(file)
    if #colors == 0 then
		colors = {
			{'red', true, vmath.vector4(1, 0, 0, 1)}, {'lime', true, vmath.vector4(0, 1, 0, 1)},
			{'blue', true, vmath.vector4(0, 0, 1, 1)}, {'magenta', false, vmath.vector4(1, 0, 1, 1)},
			{'yellow', false, vmath.vector4(1, 1, 0, 1)}, {'cyan', false, vmath.vector4(0, 1, 1, 1)},
			{'gray', false, vmath.vector4(128, 128, 128, 1)}, {'maroon', false, vmath.vector4(128, 0, 0, 1)},
			{'olive', false, vmath.vector4(128, 128, 0, 1)}, {'green', false, vmath.vector4(0, 128, 0, 1)},
			{'purple', false, vmath.vector4(128, 0, 128, 1)}, {'teal', false, vmath.vector4(0, 128, 128, 1)},
			{'navy', false, vmath.vector4(0, 0, 128, 1)}, {'black', false, vmath.vector4(0, 0, 0, 1)},
			{'orange', false, vmath.vector4(255, 165, 0, 1)}, {'brown', false, vmath.vector4(165, 42, 42, 1)},
			{'crimson', false, vmath.vector4(220, 20, 60, 1)}, {'coral', false, vmath.vector4(255, 127, 80, 1)},
			{'olive', false, vmath.vector4(128, 128, 0, 1)}, {'khaki', false, vmath.vector4(240, 230, 140, 1)},
			{'lemon', false, vmath.vector4(173, 248, 2, 1)}, {'violet', false, vmath.vector4(238 ,130 ,238 , 1)},
			{'pink', false, vmath.vector4(255, 192, 103, 1)}, {'indigo', false, vmath.vector4(75 ,0 ,130 , 1)}
		}
	end
    return colors
end
]]

--saves table clrs in memory
M.save_colors = function(clrs)
	local file = sys.get_save_file(folder, "colors")
	sys.save(file, clrs)
end

--[[This is function is used to extract a particular type of color info from a table containing tables of color
into another table. Both tables are given as arguments. The last variable is the position of the info needed and is 
an integer. ]]
M.extract_color_info = function(from_table, to_table, pos)
	for k, v in ipairs(from_table) do
		table.insert(to_table, v[pos])
	end
end

M.set_label_color = function(label, vec4) -- sets the color of a text label there is no in built function that changes the color of aa label
	go.animate(label, "color", go.PLAYBACK_ONCE_FORWARD, vec4, go.EASING_INOUTSINE, 0)
end

return M