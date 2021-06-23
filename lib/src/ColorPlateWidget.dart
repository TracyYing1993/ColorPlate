import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SeekBar.dart';

class ColorPlateWidget extends StatefulWidget {
  ValueChanged onValueChange;

  ColorPlateWidget({required this.onValueChange});

  @override
  _ColorPlateWidgetState createState() => _ColorPlateWidgetState();
}

class _ColorPlateWidgetState extends State<ColorPlateWidget> {
  Offset? currentIndex;
  List<Color> colors = [
    Color(0xff000000),
    Color(0xff333333),
    Color(0xff555555),
    Color(0xff7F7F7F),
    Color(0xffAAAAAA),
    Color(0xffD7D7D7),
    Color(0xffF2F2F2),
    Color(0xffFFFFFF),
    Color(0xffEC808D),
    Color(0xffFACD91),
    Color(0xffFFFF80),
    Color(0xffCAF982),
    Color(0xff80FFFF),
    Color(0xff81D3F8),
    Color(0xff8080FF),
    Color(0xffC280FF),
    Color(0xffD9001B),
    Color(0xffF59A23),
    Color(0xffFFFF00),
    Color(0xff95F204),
    Color(0xff00FFFF),
    Color(0xff02A7F0),
    Color(0xff0000FF),
    Color(0xff8400FF),
    Color(0xffA30014),
    Color(0xffB8741A),
    Color(0xffBFBF00),
    Color(0xff70B603),
    Color(0xff00BFBF),
    Color(0xff027DB4),
    Color(0xff0000BF),
    Color(0xff6300BF),
    Color(0xff6D000E),
    Color(0xff7B4D12),
    Color(0xff808000),
    Color(0xff4B7902),
    Color(0xff008080),
    Color(0xff015478),
    Color(0xff000080),
    Color(0xff420080),
  ];
  int defaultAlpha = 127;
  double seekBarAlpha = 0.5;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child:GridView.builder(
                itemCount: colors.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                  //横轴元素个数
                    crossAxisCount: 8,
                    //纵轴间距
                    mainAxisSpacing: 30.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 2.0),
                itemBuilder: (BuildContext context, int index) {
                  return getItemContainer(index);
                })
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          color: Colors.white,
          child: SeekBar(
            progressWidth: 6,
            value: seekBarAlpha,
            secondValue: 0.0,
            progressColor: Colors.blue,
            secondProgressColor: Colors.blue.withOpacity(0.5),
            onStartTrackingTouch: () {
              print('onStartTrackingTouch');
            },
            onProgressChanged: (value) {
              // print('onProgressChanged:$value');
              seekBarAlpha = double.parse(value.toStringAsFixed(2));
              String v = (double.parse(value.toStringAsFixed(2)) * 100).toStringAsFixed(0);
              double a2 = 255*seekBarAlpha;
              defaultAlpha = int.parse(a2.toStringAsFixed(0));
              print('defaultAlpha============${defaultAlpha}');
            },
            onStopTrackingTouch: () {
              print('onStopTrackingTouch');
            },
          ),
        )
      ],
    )
    ;
  }
  int selectIndex = 0;
  Widget getItemContainer(index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectIndex = index;
        });
        if (widget.onValueChange != null) {
          Color currentColor = colors[index];
          print('defaultAlpha==========${defaultAlpha}');
          currentColor.withAlpha(defaultAlpha);
          widget.onValueChange.call(currentColor);
        }
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: colors[index],
          shape: BoxShape.circle,
          border: Border.all(color: selectIndex == index ? Color(0xff0FBC82) : (colors[index] == Color(0xffFFFFFF) ? Color(0xffAAAAAA) : colors[index]), width: 2),
        ),
      ),
    );
  }
  // //获取当前点击位置的颜色值
  // Color getColorValue() {
  //   double x = currentIndex!.dx;
  //   double y = currentIndex!.dy;
  //   int totalRow = colors.length;
  //   int totalColumn = colors[0].length;
  //   double rectHeighth = widget.height / totalRow;
  //   double rectWidth = widget.width / totalColumn;
  //   int row = (y / rectHeighth).floor();
  //   int column = (x / rectWidth).floor();
  //   Color color = colors[row][column];
  //   return color;
  // }
}


