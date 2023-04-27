function time_translator(input, seg)
    if (input == "time") then
       yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "时间"))
    end
end

function date_translator(input, seg)
    if (input == "date") then
       yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "日期"))
       yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "日期"))
    end
end

function week_translator(input, seg)
    if (input == "week") then
        arr = {"日", "二", "三", "四", "五", "六"}
        yield(Candidate("date", seg.start, seg._end, os.date(
                            "%Y-%m-%d 星期" .. arr[tonumber(os.date("%w"))]),
                        ""))
    end
end