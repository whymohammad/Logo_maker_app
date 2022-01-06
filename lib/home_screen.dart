import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Views/create_screen.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 120,
                        width: 60,
                        child: Image(image: AssetImage('assets/splashimage.jpg'),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('ESPORTS \nLOGO MAKER',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.ondemand_video_sharp),
                title: Text('How to use'),
              ),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text('Disclaimer'),
              ),
              ListTile(
                leading: Icon(Icons.more_vert),
                title: Text('More Apps'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        //leading: Drawer(),
        title: Text('Esport Logo Maker',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        actions: [
          Column(
            children: [
              Container(
                height: 35,
                width: 25,
                child: Image(image: AssetImage('assets/crown.png'),),

              ),
              Text('Go pro')
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,

                    color: Colors.transparent,

                    border: Border.all(color: Colors.redAccent,width: 5),
                  ),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>create_screen(),),);
                      },
                      child: Center(child: Text('CREATE',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.transparent,

                    shape: BoxShape.rectangle,

                    border: Border.all(color: Colors.redAccent,width: 5),
                  ),
                  child: Center(child: Text('TEMPLATES',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.redAccent,width: 5),

                    color: Colors.transparent,
                  ),
                  child: Center(child: Text('SAVED',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,


                    border: Border.all(color: Colors.redAccent,width: 5),
                  ),
                  child: Center(child: Text('RATE APP',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView(
                shrinkWrap: true,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisExtent: 140),
                children: [
                  Container(
                    // height: 150,
                    // width: 50,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image(image: AssetImage('assets/splashimage.jpg'),),
                  ),
                    ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
