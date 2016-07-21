# build_config.rb

add this.

```
conf.gem :github => 'iij/mruby-io'
```

# code

```rb
io = File.open("bin.dat","w")
io.write(bindata)
io.close
```
