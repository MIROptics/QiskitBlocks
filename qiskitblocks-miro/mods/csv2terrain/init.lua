-- See the README for information

function csv2terrain ()

    -- get position and size info
	for line in io.lines(minetest.get_modpath("csv2terrain").."/blocks.csv")  do
		local x, y, z, block = line:match("%s*(.-),%s*(.-),%s*(.-),%s*(.-),")
		if block=="min" then
			x0, y0, z0 = tonumber(x), tonumber(y), tonumber(z)
    	end
    	if block=="max" then
       		 x1, y1, z1 = tonumber(x), tonumber(y), tonumber(z)
   		end
  	end

    -- set up the area
	local pos1 = {x = x0, y = y0, z = z0}
	local pos2 = {x = x1, y = y1, z = z1}

	local manip = minetest.get_voxel_manip()
	local edge0, edge1 = manip:read_from_map(pos1, pos2)
 	local area = VoxelArea:new{MinEdge=edge0, MaxEdge=edge1}
  	local data = manip:get_data()

    -- remove everything currently there
    for x = x0, x1 do
        for y = y0, y1+(y1-y0)/2 do
            for z = z0, z1 do
                local j = area:index(tonumber(x), tonumber(y), tonumber(z))
                data[j] = minetest.get_content_id ("air")
            end
        end
    end
    
    -- add new content
  	for line in io.lines(minetest.get_modpath("csv2terrain").."/blocks.csv")  do
    	local x, y, z, block = line:match("%s*(.-),%s*(.-),%s*(.-),%s*(.-),")
	z = z1 - z + z0
        local j = area:index(tonumber(x), tonumber(y), tonumber(z))
   		if block=="air" then
     	 		data[j] = minetest.get_content_id (block)
    		else
      			data[j] = minetest.get_content_id ("default:"..block)
  		end
 	 end
  
 	manip:set_data(data)
 	manip:write_to_map()
	manip:update_map()    
  
end


minetest.register_chatcommand("ltbv", {
    func = csv2terrain,
})