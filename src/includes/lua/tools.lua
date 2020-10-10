-- trim
function trim(str)
    return (str:gsub("^%s*(.-)%s*$", "%1"))
end

-- 檢查參數 %!KEY = VALUE
-- 某一行, 鍵, 函數(參數), 無參函數
function check_para(file, key, fn, fn_nopara)
    for l in file:lines() do
        local str = trim(l)
        -- 必須是註釋且有要求的key
        if str:sub(1,1) == "%" and str:match("!"..key) ~= nil then
            local eq = str:find("=") --必須有等號
            if eq ~= nil then
                local para = trim(str:sub(eq + 1, #str)) --等號後的是參數
                if para ~= nil then
                    fn(para)
                end
            else -- 沒等號視爲無參數
                fn_nopara()
            end
        elseif str:sub(1,1) == "\\" then -- 進入正文直接退出
            break
        end
    end
end

-- 獲取順序
function input_fill(dir)
    local lfs = require "lfs"
    local jb = {}
    for file in lfs.dir(dir) do
        local fullpath = dir .."/".. file
        local modeAttr = lfs.attributes(fullpath, "mode")
        local extension = file:sub(#file-3,#file)
        if modeAttr == "file" and extension == ".tex" then
            local file = io.open(fullpath, "r")
            check_para(file, "ORDER", 
                function(par)
                    local num = tonumber(par)
                    if num ~= nil then
                        jb[num] = fullpath
                    else
                        jb[par] = fullpath
                    end
                end, 
                function()
                    table.insert(jb, fullpath)
                end
            )
        end
    end
    local key_table = {}  
    for key,_ in pairs(jb) do  
        table.insert(key_table,key)  
    end  
    table.sort(key_table)  
    for _,key in pairs(key_table) do  
        tex.sprint("\\input{" .. jb[key] .. "}")
    end
end



