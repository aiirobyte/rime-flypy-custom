# 配置注意事项
## LUA
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
## LINK
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
