-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

--remember to set to prompt_statis in the script that uses this function to false
M.prompt = function(nodes1, nodes2)
	for k, v in ipairs(nodes1) do
		local node = gui.get_node(v)
		gui.set_enabled(node, false)
	end
	for k, v in ipairs(nodes2) do
		local node = gui.get_node(v)
		gui.set_enabled(node, true)
	end
end

return M