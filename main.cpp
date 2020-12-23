
#include <iostream>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

int main()
{
    //cout << string(getenv("PWD")) + string("/lena.png") << endl;

    Mat img = imread("/Users/vitalii.antonenko/Projects/OpenCV_Projects/Image_Proc/lena.png");
    
    namedWindow("image", WINDOW_NORMAL);
    imshow("image", img);
    waitKey(0);

    return 0;
}