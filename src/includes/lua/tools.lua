-- trim
function trim(s)
    return (s:gsub( "^%s*(.-)%s*$", "%1"))
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
        local extension = file:sub(#file-3,#file)
        if modeAttr == "file" and extension == ".tex" then
            local line = io.open(fullpath, "r"):read()
            local str = trim(line):upper()
            local eq = str:find("=")
            if eq ~= nil then
                local suji = tonumber(trim(str:sub(eq + 1, #str)))
                if str:sub(1,1) == "%" and str:match("!ORDER") ~= nil and eq ~= nil and suji ~= nil then
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



