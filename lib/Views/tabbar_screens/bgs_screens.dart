import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_maker/Views/create_screen.dart';
import 'package:logo_maker/utlities/logic.dart';
class BackGroundImages extends StatefulWidget {
  final Function callbackfunctionforbgs;
   BackGroundImages({Key? key,required this.callbackfunctionforbgs}) : super(key: key);

  @override
  _BackGroundImagesState createState() => _BackGroundImagesState();
}
List<String> bgsImages = [
  'assets/bgs1.jpeg',
  'assets/bgs3.jpeg',
  'assets/bgs5.jpeg',
  'assets/bgs6.jpeg',
  'assets/bgs7.jpeg',
  'assets/bgs9.jpeg',
];
List<Color> bgscolors = [
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
List<LinearGradient> bgsgradients = [
  LinearGradient(colors: [
    Colors.white54,
    Colors.brown,
  ]),
  LinearGradient(colors: [
    Colors.deepPurple,
    Colors.amberAccent,
  ]),
  LinearGradient(colors: [
    Colors.deepPurpleAccent,
    Colors.lime,
  ]),
  LinearGradient(colors: [
    Colors.pinkAccent,
    Colors.deepOrange,
  ]),
  LinearGradient(colors: [
    Colors.greenAccent,
    Colors.yellowAccent,
  ]),
  LinearGradient(colors: [
    Colors.red,
    Colors.purpleAccent,
  ]),
  LinearGradient(colors: [
    Colors.deepOrangeAccent,
    Colors.transparent,
  ]),
  LinearGradient(colors: [
    Colors.black87,
    Colors.white12,
  ]),
  LinearGradient(colors: [
    Colors.purpleAccent,
    Colors.red,
  ]),
];
List<String> bgsEffects = [
  'assets/effects1.jpeg',
  'assets/effects2.jpeg',
  'assets/effects3.jpeg',
  'assets/effects4.jpeg',
  'assets/effects5.jpeg',
  'assets/effects6.jpeg',

];

var selectedTab = 0 ;
var bgsOpactyValue = 1.0;
class _BackGroundImagesState extends State<BackGroundImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectedTab == 0 ? bgsWidget():Container(),
            selectedTab == 1 ? colorsWidget():Container(),
            selectedTab == 2 ? effectsWidget():Container(),
            selectedTab == 3 ? gradientWidget():Container(),
            selectedTab == 4 ? OpactyWidget(): Container(),
            selectedTab == 5 ? ClearWidget(): Container(),
            Row(
              children: [
                InkWell(
                  onTap: (){
                  setState(() {
                    selectedTab=0;
                  });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Icon(Icons.collections_outlined,size: 35,),
                        Text('BGs',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTab=1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      children: [
                        Icon(Icons.color_lens_outlined,size: 35,),
                        Text('Colors',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTab=2;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      children: [
                        Icon(Icons.edit_attributes_outlined,size: 35,),
                        Text('Effects',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTab=3;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      children: [
                        Icon(Icons.gradient_outlined,size: 35,),
                        Text('Gradient',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTab=4;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      children: [
                        Icon(Icons.opacity_outlined,size: 35,),
                        Text('Opacity',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTab=5;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      children: [
                        Icon(Icons.border_clear,size: 35,),

                        Text('Clear',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),

              ],
            )



          ],
        ),
      ),

    );
  }

  bgsWidget() {
    return Container(
      // color: Colors.black87,
      width: 500,
      height: 174,
      child: GridView.builder(
          itemCount: bgsImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            mainAxisExtent: 70,

          ),
          itemBuilder: (context,i){
            return InkWell(
              onTap: (){
                setState(() {
                  Logic.isBgs = false;
                  selectedbgs = bgsImages[i];
                  widget.callbackfunctionforbgs();
                });

              },
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(bgsImages[i]),fit: BoxFit.cover
                    )

                ),

              ),
            );
          }),
    );
  }

  colorsWidget() {
    return Container(
      height: 174,
      width: 500,
      child: GridView.builder(
          itemCount: bgscolors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 60),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  Logic.isBgs = true;
                  Logic.isColors = false;
                  Logic.bgsColors = bgscolors[i];
                  widget.callbackfunctionforbgs();

                });
              },
              child: Container(
                //height: 50,
                //width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: bgscolors[i]),
              ),
            );
          }),
    );
  }

  gradientWidget() {
    return Container(
      height: 174,
      width: 500,
      child: GridView.builder(
          itemCount: bgsgradients.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 60),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: (){
                setState(() {
                  Logic.isColors = true;
                Logic.bgsgradient = bgsgradients[i];
                widget.callbackfunctionforbgs();



                });
              },
              child: Container(
                //height: 50,
                //width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  gradient: bgsgradients[i],
                ),
              ),
            );
          }),
    );
  }

  OpactyWidget() {
    return Container(
      height: 173,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('Opacity',),
            Slider(
                value:Logic.bgsOpactyValue,
                min: 0.0,
                max: 1.0,

                onChanged: (val){
                  setState(() {
                    Logic.bgsOpactyValue= val;
                    widget.callbackfunctionforbgs();



                  });

                }),
          ],
        ),
      ),
    );
  }

  effectsWidget() {
    return Column(
      children: [


        Container(
          // color: Colors.black87,
          width: 500,
          height: 174,
          child: GridView.builder(
              itemCount: bgsEffects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                mainAxisExtent: 70,

              ),
              itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    setState((

                        ) {
                      Logic.selectedEffect = bgsEffects[i];
                       widget.callbackfunctionforbgs();

                    });

                  },

                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(bgsEffects[i]),fit: BoxFit.cover
                        )

                    ),

                  ),
                );
              }),
        ),
      ],
    );
  }

  ClearWidget() {
    return Container(
      width: 500,
      height: 174,
      child: InkWell(
        onTap: (){
          setState(() {
            Logic.selectedEffect = '';
            selectedimage = '';
            selectedbgs = '';
            Logic.selectedEffect = '';
            widget.callbackfunctionforbgs();

          });
        },
          child: Center(child: Text('Clear All',style: TextStyle(color: Colors.black,fontSize: 30),))),

    );
  }
}
