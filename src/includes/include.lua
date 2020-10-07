function inputAll(dir)
    for file in lfs.dir(dir) do
    fullpath = dir .."/".. file
    modeAttr = lfs.attributes(fullpath, "mode")
    extension = string.sub(file,#file-3,#file)
    if modeAttr == "file" and extension == ".tex" then
    tex.sprint("\\input{" .. fullpath .. "}")
    end
    end
end