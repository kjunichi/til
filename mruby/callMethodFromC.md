# Call ruby method from C code

```c
mrb_value val = mrb_funcall(mrb, self, "myinit", 0);
```


# VS

```c
haarcascadePath = mrb_str_new_cstr( mrb, "" );
mrb_iv_set(mrb, self, mrb_intern(mrb, "@haarcascade_path", strlen("@haarcascade_path")+1), haarcascadePath);
```

# Link

- http://naoty.hatenablog.com/entry/2013/05/03/231346
