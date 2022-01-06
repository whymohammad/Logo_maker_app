import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Text_screen extends StatefulWidget {
  const Text_screen({Key? key}) : super(key: key);

  @override
  State<Text_screen> createState() => _Text_screenState();
}

class _Text_screenState extends State<Text_screen> {
  @override
  Widget build(BuildContext context) {
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
    var selectedIndex = 0;

    return Scaffold(
      body: Column(
        children: [
        selectedIndex == 1 ?  Container(
            height: 160,
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
                          border: Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                      child: Center(child: Text('Font'))
                  );
                }),

          ):Container(height: 100,width: 100,color: Colors.green,),

          selectedIndex ==0 ? Container(
            child: Text('fonts'),
          ):Container(),


          selectedIndex ==2 ? Container(
            child: Text('gradient'),
          ):Container(),

          selectedIndex ==3 ? Container(
            child: Text('shadow'),
          ):Container(),

          selectedIndex ==4 ? Container(
            child: Text('Spacing'),
          ):Container(),
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
                itemBuilder: (context,i){

              return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = i;
                    print('$selectedIndex MY INDEX' );
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: 98,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white

                  ),
                  child: Center(child: Text(fontproperties[i],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
