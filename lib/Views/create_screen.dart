import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_maker/Views/tabbar_screens/logos_screen.dart';
import 'package:logo_maker/Views/tabbar_screens/text_screen.dart';

String selectedimage = 'assets/ninja.jpg';

class create_screen extends StatefulWidget {


  create_screen({Key? key}) : super(key: key);

  @override
  _create_screenState createState() => _create_screenState();
}

class _create_screenState extends State<create_screen> {
  bool isSlected = false;

  upadateimage() {
    setState(() {});
  }

   changeTextColor() {
    setState(() {});
  }
  changeFontStyle() {
    setState(() {});
  }

  TextEditingController textcontroller = TextEditingController();
  var top = 10.0;
  var left = 10.0;

  // var right = 10.0;
  // var bottom = 10.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 435,
                  width: double.infinity,
                  color: Colors.black54,
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                              height: 300,
                              width: 300,
                              child: Image(
                                image: AssetImage(selectedimage),
                              )),
                        ),
                        Positioned(
                          top: top,
                          left: left,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                textcontroller.text,style: fontStyle.copyWith(
                                color: newColor.withOpacity(0.6),
                                fontSize: 30,
                                
                              ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onVerticalDragUpdate: (DragUpdateDetails dd) {
                      print(dd);
                      setState(() {
                        top = dd.localPosition.dy;
                        left = dd.localPosition.dx;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: TabBar(
                    labelColor: Colors.black,
                    isScrollable: true,
                    //physics: NeverScrollableScrollPhysics(),
                    tabs: [
                      Tab(icon: Icon(Icons.gamepad), text: 'Logos'),
                      Tab(icon: Icon(Icons.settings), text: 'Settings'),
                      InkWell(
                        onTap: () {
                          dialoguebox(textcontroller);
                          //Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Text_screen(),),);
                        },
                        child: Tab(icon: Icon(Icons.title), text: 'Text'),
                      ),
                      Tab(icon: Icon(Icons.image), text: 'BGs'),
                      Tab(icon: Icon(Icons.format_shapes), text: 'Shape'),
                      Tab(icon: Icon(Icons.save), text: 'Save'),
                    ],
                  ),
                ),
                Container(
                  width: 700,
                  height: 225,
                  child: TabBarView(
                    //physics: NeverScrollableScrollPhysics(),
                    children: [
                      Logo_screen(callbackfunction: upadateimage),
                      // Container(),
                      Container(),
                      Text_screen(callbackfunctionForText: changeTextColor,callbackfunctionForTextStyle: changeFontStyle,),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dialoguebox(TextEditingController mycontroller) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 85),
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                Text(
                  'Add Text',
                  style: TextStyle(color: Colors.red[900], fontSize: 16),
                ),
                Divider(
                  color: Colors.red[900],
                  thickness: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  width: 250,
                  height: 120,
                  child: TextFormField(
                    controller: mycontroller,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Text Here',
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 135,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[900]),
                        child: Text('Cancel'),
                      ),
                    ),
                    Container(
                      width: 135,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[900]),
                        child: Text('Add'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
