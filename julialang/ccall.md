```jl
qsort{T}(a::Vector{T}, f::Function) = ccall(:qsort, Void, (Ptr{T}, Int, Int, Ptr{Void}), a, length(a), sizeof(T), cfunction(f, Int32, (Ptr{T},Ptr{T})))
```

```jl
sorti(a,b) = (aa=unsafe_load(a); bb=unsafe_load(b); print("cmp $aa to $bb\n"); Int32(aa - bb))
x = [63,12,5,25,2]
qsort(x,sorti)
println(x)
```
