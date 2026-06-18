--Tree Generation--


Trees = {}

function Trees:find_hotspot_prox(HOTSPOT_MAP, current_x, current_y, width) --Essential-- --Will return distance (int)--
    local count = 0
    for i = current_y, 1, -1 do
        for z = width, 1, -1 do
            if (HOTSPOT_MAP[i][z] == 1) then
                return count
            else
                count = count + 1
            end
        end
    end
    return count
end

function Trees:create_hotspots(THE_MAP, length, height, hotspot_count)
    local hotspot_radius_constant = 10
    local current = 0

    --Filling with Zeroes-- --Need to do this as find_hotspot_prox references indexes ahead of "current_x, current_y"
    HOTSPOT_MAP = {}
    for i = 1, height do
        HOTSPOT_MAP[i] = {}
        for q = 1, length do
            HOTSPOT_MAP[i][q] = 0
        end
    end




    for i = 1, height do
        for j = 1, length do
            if (math.random(5) == 2) then
                --Check nearby prox, place--
                if (self:find_hotspot_prox(HOTSPOT_MAP, j, i, length) >= hotspot_radius_constant) then
                    HOTSPOT_MAP[i][j] = 1 --Hotspot--
                    THE_MAP[i][j] = 5     --Visualizing--
                    current = current + 1
                else
                    HOTSPOT_MAP[i][j] = 0 --Base--
                end
            else
                HOTSPOT_MAP[i][j] = 0 --Base--
            end
        end
    end


    return HOTSPOT_MAP
end

function Trees:is_tree(HOTSPOT_MAP, current_x, current_y, length) --Probablity calculations--
    --Returns Float--
    if (math.random(10) == 2) then                                --Random assured chance for tree--
        return 0.9
    else
        return (self:find_hotspot_prox(HOTSPOT_MAP, current_x, current_y, length) / 100)
    end
end

function Trees:rendering_trees(THE_MAP, length, height) --Called Function--
    local hotspot_count = height / 10
    local HOTSPOT_MAP = self:create_hotspots(THE_MAP, length, height, hotspot_count)


    for i = 1, height do
        for z = 1, length do
            if (self:is_tree(HOTSPOT_MAP, z, i, length) >= 0.6 and THE_MAP[i][z] ~= 3) then
                --Generate a tree--
                THE_MAP[i][z] = 4
            end
        end
    end
end

return Trees
