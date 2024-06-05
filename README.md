# 简介
方案及来源：[小鹤音形](https://flypy.com/) + [雾凇拼音](https://github.com/iDvel/rime-ice) + [melt_eng](https://github.com/tumuyan/rime-melt) 英文输入
输入功能及来源：
- [小鹤音形反查](https://github.com/amorphobia/openfly)
- [小鹤音形辅助码](https://github.com/HowcanoeWang/rime-lua-aux-code)
- [日期+时间+大写数字+符号输入](https://github.com/iDvel/rime-ice)
- [自动造词](https://github.com/ryan00zou/rime-xhup)
## 我的配置摸索
### LUA
- 文件/路径
./rime.lua LUA总配置路径
./lua/name_space.lua LUA执行文件
- 调用
./xxx.schema.yaml:
```
engine:
  filters:
    - luafilter@name_space
```
./rime.lua
```
name_space = require("file_name")
```
### LINK
- `import_preset`
案例：
```
patch:
  punctuator/import_preset: symbols
```
将 `symbols` 文件中的 `punctuator` 预设值设置到 `patch/puctuator` 的值上。
- `__include`
案例：
```
punctuator:
  symbols:
    __include: symbols_private:/symbols
```
将 `symbols_private` 文件中 `punctuator/symbols` 对象内的键值对加如到当前配置文件的 `punctuator/symbols` 对象中。
所以两者最大的不同是一个是全量，一个是增量，规则是两者不能同时进行。类似于 YAML 单文件内的锚点功能。
# TODO
- [] 编码达到4个后，如果候选项有英文单词，则将英文单词的权重提高
