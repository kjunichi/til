
```c
unsigned char data[256];
int i;

for(i = 0; i<256; i++) {
  data[i]=(unsigned char)i;
}
retrun mrb_str_new(mrb,(const char*)data, 256);

```
