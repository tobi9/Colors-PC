-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

--This function receives two arguments the first argument is the string id of a node, the
--is located. The color info tables are of the format {str, bool, vec4} where
-- str is the name and identifier of the color, bool is it's unlock status and 
--vec4 is the value of the color
--local folder = "trick colors test"
local current_col -- needed by the undo function to save the changes

M.set_node_color = function(node_id, col)
	--col and node_id are concatenated to avoid conflicts in memory location.
	local file = sys.get_save_file(folder, col.."["..node_id.."]") --the braces are added because the gui.get_id returns the string enclosed in braces
	local table_of_colors = sys.load(file)
	local node_color_info
	if #table_of_colors ~= 0 then
		node_color_info = table_of_colors[1]
		local node = gui.get_node(node_id)
		gui.set_color(node, node_color_info)			
	end
end

M.set_new_node_color = function(node, node_name, new_clr_info, col)
	--col and node_name are concatenated to avoid conflicts in memory location.
	local save_name = col.."["..node_name.."]"
	local file = sys.get_save_file(folder, save_name)
    gui.set_color(node, new_clr_info[3])
	sys.save(file, {new_clr_info[3]})
	current_col = col
end

--This function saves the inaltered state of the collection so the player can revert all the changes made.
-- the first arg is a table containing the ids of the nodes in the table
M.take_snapshot = function(node_table, color_table)
	for k, v in ipairs(node_table) do
		local color = gui.get_color(gui.get_node(v))
		table.insert(color_table, color)
	end
end

M.clear_changes = function(node_table, color_table)
	for k, v in ipairs(node_table) do
		local node = gui.get_node(v)
		gui.set_color(node, color_table[k])
	end
end

--ldgr = ledger
--This functions puts a table {node, clr} into the ledger.clr is the color the node was before it was changed
M.record_change = function(node, ldgr)
	table.insert(ldgr, {node, gui.get_color(node)})
end

M.undo_change = function(ldgr)
	local i = #ldgr
	if i > 0 then
		--print(ldgr[i][1], ldgr[i][2])
		gui.set_color(ldgr[i][1], ldgr[i][2])
		local node_id = gui.get_id(ldgr[i][1])
		local file = sys.get_save_file(folder, current_col..node_id)
		sys.save(file, {ldgr[i][2]})
		table.remove(ldgr, i)
	end
end

return M