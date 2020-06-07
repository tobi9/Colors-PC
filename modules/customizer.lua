-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

--This function receives three arguments the first argument is the string id of a node, the
--second is the default color(a table) of the node and the third(a string) is the collection in which the node
--is located. The color info tables are of the format {str, bool, vec4} where
-- str is the name and identifier of the color, bool is it's unlock status and 
--vec4 is the value of the color

M.set_node_color = function(node_id, dflt_clr_info, col)
	local folder = "trick colors 2"
	--col and node_id are concatenated to avoid conflicts in memory location.
	local file = sys.get_save_file(folder, col..node_id)
	local table_of_colors = sys.load(file)
	local node_color_info
	if #table_of_colors ~= 0 then
		node_color_info = table_of_colors
	else
		--set it to the default color and save it in memory
		node_color_info = dflt_clr_info
		sys.save(file, dflt_clr_info)
	end
	local node = gui.get_node(node_id)
	gui.set_color(node, node_color_info[3])
end

M.set_new_node_color = function(node_id, new_clr_info, col)
	local folder = "trick colors 2"
	--col and node_id are concatenated to avoid conflicts in memory location.
	local file = sys.get_save_file(folder, col..node_id)
    local node = gui.get_node(node_id)
    gui.set_color(node, new_clr_info[3])
    sys.save(file, new_clr_info)
end

return M