```swift
import Darwin

let handle = dlopen(nil, RTLD_NOW)
let sym = dlsym(handle, "random")

typealias randomFunc = @convention(c) () -> CInt
let f = unsafeBitCast(sym, randomFunc.self)
let result = f()
dlclose(handle)
print(result)
```
