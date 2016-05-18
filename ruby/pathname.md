# Pathname

```rb
require 'pathname'

juliaPath = `which julia`
juliaConfig=Pathname(juliaPath).dirname.dirname / "share/julia/julia-config.jl" 
`#{juliaConfig} --cflags`
```

