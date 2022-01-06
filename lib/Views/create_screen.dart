import 'package:flutter/material.dart';
import 'package:logo_maker/Views/tabbar_screens/logos_screen.dart';
import 'package:logo_maker/Views/tabbar_screens/text_screen.dart';

String selectedimage = 'assets/ninja.jpg';

class create_screen extends StatefulWidget {
  create_screen({Key? key}) : super(key: key);

  @override
  _create_screenState createState() => _create_screenState();
}

class _create_screenState extends State<create_screen> {
  upadateimage() {
    setState(() {});
  }

  TextEditingController textcontroller = TextEditingController();
 // var top = 10.0;
  //var left = 10.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   children: [
                //     Icon(Icons.arrow_back),
                //     SizedBox(
                //       width: 240,
                //     ),
                //     Icon(Icons.subdirectory_arrow_left),
                //    SizedBox(
                //       width: 10,
                //     ),
                //     Icon(Icons.subdirectory_arrow_right),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Icon(Icons.weekend),
                //   ],
                // ),
                Container(
                  height: 435,
                  width: double.infinity,
                  color: Colors.yellow[100],
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
                      Center(
                        child: Text(
                            textcontroller.text,
                            style:
                                TextStyle(fontSize: 19, color: Colors.white),
                          ),
                      ),
                    ],
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
                      Text_screen(),
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
        }
        );
  }
}
