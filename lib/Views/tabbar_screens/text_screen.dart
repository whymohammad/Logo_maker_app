import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_maker/utlities/slider.dart';

Color newColor = Colors.white54;
TextStyle fontStyle = GoogleFonts.allerta();
class Text_screen extends StatefulWidget {
  final Function callbackfunctionForText;
  final Function callbackfunctionForTextStyle;
  Text_screen({Key? key, required this.callbackfunctionForText,required this.callbackfunctionForTextStyle,})
      : super(key: key);

  @override
  State<Text_screen> createState() => _Text_screenState();
}

class _Text_screenState extends State<Text_screen> {
  bool isSelected = false;

  List<String> fontproperties = [
    'Fonts',
    'Colors',
    'Gradients',
    'Shadow',
    'Spacing',
    'Stroke',
    'Pattern',
    'Opacity',
  ];
  List<TextStyle> fontList = [
    GoogleFonts.alatsi(),
    GoogleFonts.zenLoop(),
    GoogleFonts.amethysta(),
    GoogleFonts.aladin(),
    GoogleFonts.adventPro(),
    GoogleFonts.aclonica(),
    GoogleFonts.alfaSlabOne(),
    GoogleFonts.alef(),
    GoogleFonts.allertaStencil(),
  ];
  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.amberAccent,
    Colors.deepOrange,
    Colors.teal,
    Colors.cyanAccent,
    Colors.deepPurpleAccent,
    Colors.deepPurple,
    Colors.cyan,
    Colors.amber,
    Colors.yellow,
    Colors.green,
    Colors.grey,
    Colors.red,
    Colors.redAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.brown,
    Colors.indigo,
    Colors.lightGreen,
    Colors.lime,
  ];


  // static var change_color ;
  var selectedAction = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          selectedAction == 0 ? FontsWidget() : Container(),
          selectedAction == 1 ? ColorsWidget() : Container(),
          selectedAction == 2 ? GradientsWidget() : Container(),
          selectedAction == 3 ? shadowWidget() : Container(),
          selectedAction == 4 ? spacingWidget() : Container(),
          selectedAction == 5 ? strokeWidgets() : Container(),
          selectedAction == 6 ? patternWidget() : Container(),
          selectedAction == 7 ? opacityWideget() : Container(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: 400,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fontproperties.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedAction = i;
                        print('$selectedAction MY INDEX');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 50,
                      width: 98,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white),
                      child: Center(
                          child: Text(
                        fontproperties[i],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  FontsWidget() {
    return Container(
        height: 185,
        width: 500,
        child:GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: fontList.length,
            itemBuilder: (context,i){
          return InkWell(
            onTap: (){
              fontStyle = fontList[i];
             widget.callbackfunctionForTextStyle();


            },
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 10, top: 20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text('F ont',
                    style: fontList[i]
                ),
              ),
            ),
          );
            }
        )
    );
  }

  ColorsWidget() {
    return Container(
      height: 185,
      width: 500,
      child: GridView.builder(
          itemCount: colors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 60),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  newColor = colors[i];
                  widget.callbackfunctionForText();
                   print(newColor);
                });
              },
              child: Container(
                //height: 50,
                //width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: colors[i]),
              ),
            );
          }),
    );
  }

  GradientsWidget() {
    return Container(
      height: 185,
      width: 500,
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 60),
          itemBuilder: (context, i) {
            return Container(
              //height: 50,
              //width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellow),
            );
          }),
    );
  }

  shadowWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                'Shadow Radius',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              MyStatefulWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                'Shadow x',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              MyStatefulWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                'Shadow Y',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              MyStatefulWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 70,
            width: 500,
            // color: Colors.brown,
            child: ListView.builder(
              itemCount: colors.length,
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors[i],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 100,
                    width: 80,
                    //margin: EdgeInsets.only(right: 10),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 1,
        )
      ],
    );
  }

  spacingWidget() {
    return Container(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('Letter Spacing'),
            MyStatefulWidget(),
          ],
        ),
      ),
    );
  }

  strokeWidgets() {
    return Column(
      children: [
        Container(
          height: 40,
          //color: Colors.brown,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(' Stroke'),
                MyStatefulWidget(),
              ],
            ),
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors[i],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 80,
                  width: 80,
                  //margin: EdgeInsets.only(right: 10),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 75,
        )
      ],
    );
  }

  patternWidget() {
    return Container(
      height: 185,
      width: double.infinity,
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 60),
          itemBuilder: (context, i) {
            return Container(
              //height: 50,
              //width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellow),
            );
          }),
    );
  }

  opacityWideget() {
    return Container(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('Opacity'),
            MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}
