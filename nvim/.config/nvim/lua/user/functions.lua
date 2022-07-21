local M = {}

M.in_list = function(name, list)
    for _, check in pairs(list) do
        if name == check then
            return true
        end
    end

    return false
end

return M
