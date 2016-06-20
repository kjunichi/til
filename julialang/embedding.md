```c
#include <julia.h>

// gcc -o test -fPIC -I$JULIA_DIR/include/julia -L$JULIA_DIR/lib/julia test.c
// -ljulia $JULIA_DIR/lib/julia/libstdc++.so.6
// export JULIA_HOME=/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin/

int main(int argc, char *argv[]) {
  /* required: setup the julia context */
  jl_init(NULL);

  /* run julia commands */
  jl_eval_string("print(sqrt(2.0))");

  /* strongly recommended: notify julia that the
       program is about to terminate. this allows
       julia time to cleanup pending write requests
       and run all finalizers
  */
  jl_atexit_hook(0);
  return 0;
}
```

```bash
gcc -o test -fPIC -I/Applications/Julia-0.4.5.app/Contents/Resources/julia/include/julia -L/Applications/Julia-0.4.5.app/Contents/Resources/julia/lib/julia test.c -ljulia -Wl,-rpath /Applications/Julia-0.4.5.app/Contents/Resources/julia/lib/julia/

export JULIA_HOME=/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin/
./test
```

- /usr/local/julia/share/julia/julia-config.jl

- PATH=$PATH:/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin
- /Applications/Julia-0.4.5.app/Contents/Resources/julia/share/julia/julia-config.jl 
