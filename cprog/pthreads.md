# 

## pthread_create

## pthread_join

# sample code

```c
#include <stdio.h>
#include <assert.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

#define WIDTH 2560
#define HEIGHT 2560

typedef struct {
        unsigned char *image;
        int starty;
        int ystep;
} MySt;

void render(int x, int y,unsigned char *imgbuf) {
        unsigned char ans;

        ans = (unsigned char)rand();

        imgbuf[3*x+(WIDTH*y)] = ans;
        imgbuf[3*x+(WIDTH*y)+1] = ans;
        imgbuf[3*x+(WIDTH*y)+2] = ans;
}

void renderLine(int starty, int ystep, unsigned char *imgbuf) {
        for(int y = starty; y < HEIGHT; y+=ystep) {
                for(int x = 0; x < WIDTH; x++) {
                        render(x,y,imgbuf);
                }
        }
}

void *thread_function(void *arg) {
        MySt *p = (MySt*)arg;
        renderLine(p->starty, p->ystep, p->image);
        return NULL;
}

void
saveppm(const char *fname, int w, int h, unsigned char *img)
{
    FILE *fp;

    fp = fopen(fname, "wb");
    assert(fp);

    fprintf(fp, "P6\n");
    fprintf(fp, "%d %d\n", w, h);
    fprintf(fp, "255\n");
    fwrite(img, w * h * 3, 1, fp);
    fclose(fp);
}

int main(void) {
        pthread_t mythread;
        unsigned char *img;
        MySt st;

        img = malloc(sizeof(char)*WIDTH*HEIGHT*3);
        st.image = img;
        st.starty = 1;
        st.ystep = 2;

        if ( pthread_create( &mythread, NULL, thread_function, (void*)&st) ) {
                printf("error creating thread.");
                abort();
        }

        renderLine(0, 2, img);

        if ( pthread_join( mythread, NULL ) ) {
                printf("error joining thread.");
                abort();
        }
        saveppm("test.ppm",WIDTH,HEIGHT,img);
        exit(0);
}
```

# Link

- https://www.ibm.com/developerworks/jp/linux/library/l-posix1/

- http://www.ibm.com/developerworks/jp/linux/library/l-posix3/
