-- trim
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- local file = io.open("kkkkkkkk.txt", "a")
-- io.output(file)

-- 獲取順序
function input_fill(dir)
    local lfs = require "lfs"
    local jb = {}
    for file in lfs.dir(dir) do
        local fullpath = dir .."/".. file
        local modeAttr = lfs.attributes(fullpath, "mode")
        local extension = string.sub(file,#file-3,#file)
        if modeAttr == "file" and extension == ".tex" then
            local line = io.open(fullpath, "r"):read()
            local str = string.upper(trim(line))
            local eq = string.find(str, "=")
            if eq ~= nil then
                local suji = tonumber(trim(string.sub(str, eq + 1, #str)))
                if string.match(str, "%!ORDER") ~= nil and eq ~= nil and suji ~= nil then
                    jb[suji] = fullpath
                end
            else
                table.insert(jb, fullpath)
            end
        end
    end

    local key_table = {}  
    --取出所有的键  
    for key,_ in pairs(jb) do  
        table.insert(key_table,key)  
    end  
    --对所有键进行排序  
    table.sort(key_table)  

    local result_table = {}
    for _,key in pairs(key_table) do  
        tex.sprint("\\input{" .. jb[key] .. "}")
    end
end



