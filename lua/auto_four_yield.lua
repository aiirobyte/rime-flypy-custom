local function should_block_auto_select(env)
    -- 如果输入长度为4并且存在英文候选词，则阻止自动上屏
    if #env.engine.context.input == 4 then
        for cand in env.engine.context:get_selected_candidate():iter() do
            if cand.type == "melt_eng" then
                return false  -- 发现英文候选，阻止自动上屏
            end
        end
    end
    return false  -- 允许自动上屏
end

local function auto_select_filter(input, env)
    if should_block_auto_select(env) then
        for cand in input:iter() do
            -- 只要遍历候选项而不执行 yield，就不会自动上屏
        end
    end

    -- yield other
    for cand in input:iter() do
        yield(cand)
    end
end

return { func = auto_select_filter }