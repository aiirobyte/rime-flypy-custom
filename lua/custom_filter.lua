-- custom_filter.lua

local M = {}

function M.init(env)
    local config = env.engine.schema.config
    env.name_space = env.name_space:gsub("^*", "")

    M.words = {}
    local list = config:get_list(env.name_space .. "/words")
    if list then
        for i = 0, list.size - 1 do
            local word = list:get_value_at(i).value
            M.words[word] = true
        end
    end

    M.map = M.words
end

function M.func(input, env)
    -- filter start
    local code = env.engine.context.input
    if M.map[code] then
        for cand in input:iter() do
            -- 可以在这里添加日志或调试代码来确认哪些词被过滤
            print("Filtered out: " .. code)
        end
    end

    -- yield other
    for cand in input:iter() do
        yield(cand)
    end
end

return M