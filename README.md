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