set xrange [0:128]
set yrange [0:128]
set title  "\"I flew here... by plane.  Why?  For the halibut.\""
plot 'data/blutux.rgb' binary array=(128,128) flipy format='%uchar' with rgbimage
