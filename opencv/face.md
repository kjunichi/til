```cp
#include <opencv2/opencv.hpp>
#include <opencv2/objdetect/objdetect.hpp>

int main() {
  const char *cascade_name = "/usr/local/opt/opencv3//share/OpenCV/"
                             "haarcascades/haarcascade_frontalface_alt.xml";
  std::cout << cascade_name << std::endl;
  cv::CascadeClassifier cascade; //分類器を示す変数

  cv::VideoCapture cap(0); //デバイスのオープン
  cap.set(CV_CAP_PROP_FRAME_WIDTH, 512);
  cap.set(CV_CAP_PROP_FRAME_HEIGHT, 384);

  // cap.open(0);//こっちでも良い．
  if ((cascade.load(cascade_name)) == NULL) {
    //読み込めなければエラー表示
    printf("Cannot load classifier cascade\n");
    return -1;
  }

  if (!cap.isOpened()) //カメラデバイスが正常にオープンしたか確認．
  {
    //読み込みに失敗したときの処理
    return -1;
  }

  while (1) //無限ループ
  {
    cv::Mat grayImage;
    cv::Mat frame;
    cap >> frame; // get a new frame from camera

    //
    //取得したフレーム画像に対して，クレースケール変換や2値化などの処理を書き込む．
    //
    //検出用に、入力をグレイスケール変換
    cvtColor(frame, grayImage, CV_BGR2GRAY, 0);
    equalizeHist(grayImage, grayImage);

    cv::vector<cv::Rect> faces; //検出結果
    cascade.detectMultiScale(grayImage, faces,
                             1.1,             // scale factor
                             3,               // minimum neighbors
                             0,               // flags
                             cv::Size(20, 20) // minimum size
                             );
    //個々の検出領域を表す変数
    cv::vector<cv::Rect>::const_iterator r;
    //検出領域の一つ一つに対するループ処理
    for (r = faces.begin(); r != faces.end(); r++) {

      cv::Point pt1; //領域の始点
      cv::Point pt2; //領域の終点

      //得られた結果をもとに、領域の始点と終点を計算
      pt1.x = r->x;
      pt1.y = r->y;
      pt2.x = r->x + r->width - 1;
      pt2.y = r->y + r->height - 1;

      //検出した領域にあわせて矩形を描く
      cv::rectangle(frame, pt1, pt2, CV_RGB(255, 0, 0), 1, 4, 0);
    }
    cv::imshow("window", frame); //画像を表示．
    // cv::imshow("gray", grayImage); //画像を表示．
    int key = cv::waitKey(1);
    if (key == 113) // qボタンが押されたとき
    {
      break;               // whileループから抜ける．
    } else if (key == 115) // sが押されたとき
    {
      //フレーム画像を保存する．
      cv::imwrite("img.png", frame);
    }
  }
  cv::destroyAllWindows();
  return 0;
}
```

```bash
PKG_CONFIG_PATH=/usr/local/opt/opencv3/lib/pkgconfig clang test.cpp `pkg-config opencv --libs --cflags` -lc++
```

# 参考資料

- [C時代の enum CV_** を駆逐したい - Qiita](http://qiita.com/tomoaki_teshima/items/0bca3b8af03cc9242815)
