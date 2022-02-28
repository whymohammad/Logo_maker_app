import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:logo_maker/utlities/logic.dart';
import 'package:logo_maker/Views/tabbar_screens/logos_screen.dart';
import 'package:logo_maker/Views/tabbar_screens/text_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'tabbar_screens/bgs_screens.dart';

String selectedbgs = '';
String selectedimage = '';
bool isgradient = false;

class create_screen extends StatefulWidget {
  create_screen({Key? key}) : super(key: key);

  @override
  _create_screenState createState() => _create_screenState();
}

class _create_screenState extends State<create_screen> {
  final controller = ScreenshotController();

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

  changeBgsImage() {
    setState(() {});
  }

  TextEditingController textcontroller = TextEditingController();
  List<String> allMyText = [];
  var top = 10.0;
  var left = 10.0;
  double angle = 0.0;

  void _onPanUpdateHandler(DragUpdateDetails details) {
    final touchPositionFromCenter = details.localPosition;
    setState(
      () {
        angle = touchPositionFromCenter.direction;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Screenshot(
                  controller: controller,
                  child: Container(
                    child: Logic.isBgs == false
                        ? selectedbgs == ''
                            ? selectedimage == ''
                                ? Logic.selectedEffect == ''
                                    ? Container(
                                        height: Get.height * 0.570,
                                        width: double.infinity,
                                      )
                                    : Container(
                                        height: Get.height * 0.570,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Logic.bgsColors,
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Logic.bgsColors,
                                                    BlendMode.color),
                                                image: AssetImage(
                                                    Logic.selectedEffect),
                                                fit: BoxFit.cover)),
                                      )
                                : Container(
                                    child: Center(
                                      child: Container(
                                          height: Get.height * 0.570,
                                          width: 300,
                                          child: selectedimage.isEmpty
                                              ? SizedBox()
                                              : Image(
                                                  image:
                                                      AssetImage(selectedimage),
                                                )),
                                    ),
                                  )
                            : selectedimage == ''
                                ? Opacity(
                                    opacity: Logic.bgsOpactyValue,
                                    child:Stack(
                                      children: [
                                      Container(
                                       height: Get.height * 0.570,
                                       width: double.infinity,
                                       // color: Colors.black54,

                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                             image: AssetImage(selectedbgs),
                                             fit: BoxFit.cover),
                                       ),
                                      ),
                                        ListView.builder(
                                            itemCount: allMyText.length,
                                             physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (ctx,i){
// print('this is${i}');
                                              return  Logic.istextIndex   == 0 ? GestureDetector(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 200,
                                                  //width : 50,
                                                  // color: Colors.red,
                                                  child: Stack(

                                                    children: [

                                                      Positioned(
                                                        top: top,
                                                        left: left,
                                                        child: Container(
                                                          height: 60,
                                                          width: 160,
                                                          color: Colors.green,

                                                          //color: Colors.green,
                                                          child:
                                                          Logic.istextavailable ==
                                                              true
                                                              ? Transform.rotate(
                                                            angle: angle,
                                                            child: Stack(

                                                              children: [

                                                                Positioned(
                                                                  height: 37,
                                                                  right: 0,
                                                                  child:
                                                                  CircleAvatar(
                                                                    minRadius:
                                                                    12,
                                                                    backgroundColor:
                                                                    Colors.grey[
                                                                    800],
                                                                    child:
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              allMyText.clear();
                                                                              Logic.istextavailable =
                                                                              false;
                                                                              textcontroller.text =
                                                                              '';
                                                                            });
                                                                      },
                                                                      child:
                                                                      Text(
                                                                        'x',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            25),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(child: Text(
                                                                  allMyText[i],
                                                                  style: fontStyle
                                                                      .copyWith(
                                                                      color: newColor,
                                                                      fontSize: 30,
                                                                      letterSpacing:
                                                                      Spacingvalue,
                                                                      shadows: <
                                                                          Shadow>[
                                                                        Shadow(
                                                                          color: Logic
                                                                              .shadowColors,
                                                                          blurRadius: Logic
                                                                              .shadowRadius,
                                                                          offset: Offset(
                                                                            Logic
                                                                                .shadowDx,
                                                                            Logic
                                                                                .shadowDy,
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                )),
                                                                Positioned(
                                                                  bottom: 5,
                                                                  left: 0,
                                                                  child:
                                                                  CircleAvatar(
                                                                    minRadius:
                                                                    12,
                                                                    backgroundColor:
                                                                    Colors.grey[
                                                                    800],
                                                                    child: GestureDetector(
                                                                        onPanUpdate:
                                                                        _onPanUpdateHandler,
                                                                        child: Icon(
                                                                            Icons.rotate_left)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                              : Container(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onVerticalDragUpdate:
                                                    (DragUpdateDetails dd) {
                                                  print(dd);
                                                  setState(() {
                                                    top = dd.localPosition.dy;
                                                    left = dd.localPosition.dx;
                                                  });
                                                },
                                              ): Container();




                                            }),

                                      ],

                                    ),

                                  )
                                : Opacity(
                                    opacity: Logic.bgsOpactyValue,
                                    child: Container(
                                      height: Get.height * 0.570,
                                      width: double.infinity,
                                      // color: Colors.black54,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(selectedbgs),
                                            fit: BoxFit.cover),
                                      ),
                                      child: GestureDetector(
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                  height: 300,
                                                  width: 300,
                                                  child: selectedimage.isEmpty
                                                      ? SizedBox()
                                                      : Image(
                                                          image: AssetImage(
                                                              selectedimage),
                                                        )),
                                            ),
                                            Positioned(
                                              top: top,
                                              left: left,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 1)),
                                                child: Opacity(
                                                  opacity: Opacityvalue,
                                                  child: Logic.isGradient
                                                      ? Text(
                                                          textcontroller.text,
                                                          style: fontStyle
                                                              .copyWith(
                                                                  color:
                                                                      newColor,
                                                                  fontSize: 30,
                                                                  letterSpacing:
                                                                      Spacingvalue,
                                                                  shadows: <
                                                                      Shadow>[
                                                                Shadow(
                                                                  color: Logic
                                                                      .shadowColors,
                                                                  blurRadius: Logic
                                                                      .shadowRadius,
                                                                  offset:
                                                                      Offset(
                                                                    Logic
                                                                        .shadowDx,
                                                                    Logic
                                                                        .shadowDy,
                                                                  ),
                                                                ),
                                                              ]),
                                                        )
                                                      : Text(
                                                          textcontroller.text,
                                                          style: fontStyle
                                                              .copyWith(
                                                            //color: newColor,
                                                            fontSize: 30,
                                                            letterSpacing:
                                                                Spacingvalue,
                                                            foreground: Paint()
                                                              ..shader = newtextgrad
                                                                  .createShader(
                                                                Rect.fromLTWH(
                                                                    0.0,
                                                                    0.0,
                                                                    200.0,
                                                                    100.0),
                                                              ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        onVerticalDragUpdate:
                                            (DragUpdateDetails dd) {
                                          print(dd);
                                          setState(() {
                                            top = dd.localPosition.dy;
                                            left = dd.localPosition.dx;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                        : Logic.selectedEffect == '' || selectedimage == ''
                            ? Logic.isColors == false
                                ? Container(
                                    height: Get.height * 0.570,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Logic.bgsColors,
                                      image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Logic.bgsColors, BlendMode.color),
                                          image:
                                              AssetImage(Logic.selectedEffect),
                                          fit: BoxFit.cover),
                                    ),
                                    child: GestureDetector(
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                                height: 300,
                                                width: 300,
                                                child: selectedimage.isEmpty
                                                    ? SizedBox()
                                                    : Image(
                                                        image: AssetImage(
                                                            selectedimage),
                                                      )),
                                          ),
                                          Positioned(
                                            top: top,
                                            left: left,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 1)),
                                              child: Opacity(
                                                opacity: Opacityvalue,
                                                child: Logic.isGradient
                                                    ? Text(
                                                        textcontroller.text,
                                                        style: fontStyle
                                                            .copyWith(
                                                                color: newColor,
                                                                fontSize: 30,
                                                                letterSpacing:
                                                                    Spacingvalue,
                                                                shadows: <
                                                                    Shadow>[
                                                              Shadow(
                                                                color: Logic
                                                                    .shadowColors,
                                                                blurRadius: Logic
                                                                    .shadowRadius,
                                                                offset: Offset(
                                                                  Logic
                                                                      .shadowDx,
                                                                  Logic
                                                                      .shadowDy,
                                                                ),
                                                              ),
                                                            ]),
                                                      )
                                                    : Text(
                                                        textcontroller.text,
                                                        style:
                                                            fontStyle.copyWith(
                                                          //color: newColor,
                                                          fontSize: 30,
                                                          letterSpacing:
                                                              Spacingvalue,
                                                          foreground: Paint()
                                                            ..shader = newtextgrad
                                                                .createShader(
                                                              Rect.fromLTWH(
                                                                  0.0,
                                                                  0.0,
                                                                  200.0,
                                                                  100.0),
                                                            ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onVerticalDragUpdate:
                                          (DragUpdateDetails dd) {
                                        print(dd);
                                        setState(() {
                                          top = dd.localPosition.dy;
                                          left = dd.localPosition.dx;
                                        });
                                      },
                                    ),
                                  )
                                : selectedimage == ''
                                    ? Container(
                                        height: Get.height * 0.570,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: Logic.bgsgradient,
                                          //color: Logic.bgsColors,
                                          image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Logic.bgsColors,
                                                  BlendMode.color),
                                              image: AssetImage(
                                                  Logic.selectedEffect),
                                              fit: BoxFit.cover),
                                        ),
                                        child: GestureDetector(
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    child: selectedimage.isEmpty
                                                        ? SizedBox()
                                                        : Image(
                                                            image: AssetImage(
                                                                selectedimage),
                                                          )),
                                              ),
                                              Positioned(
                                                top: top,
                                                left: left,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1)),
                                                  child: Opacity(
                                                    opacity: Opacityvalue,
                                                    child: Logic.isGradient
                                                        ? Text(
                                                            textcontroller.text,
                                                            style: fontStyle.copyWith(
                                                                color: newColor,
                                                                fontSize: 30,
                                                                letterSpacing:
                                                                    Spacingvalue,
                                                                shadows: <
                                                                    Shadow>[
                                                                  Shadow(
                                                                    color: Logic
                                                                        .shadowColors,
                                                                    blurRadius:
                                                                        Logic
                                                                            .shadowRadius,
                                                                    offset:
                                                                        Offset(
                                                                      Logic
                                                                          .shadowDx,
                                                                      Logic
                                                                          .shadowDy,
                                                                    ),
                                                                  ),
                                                                ]),
                                                          )
                                                        : Text(
                                                            textcontroller.text,
                                                            style: fontStyle
                                                                .copyWith(
                                                              //color: newColor,
                                                              fontSize: 30,
                                                              letterSpacing:
                                                                  Spacingvalue,
                                                              foreground:
                                                                  Paint()
                                                                    ..shader =
                                                                        newtextgrad
                                                                            .createShader(
                                                                      Rect.fromLTWH(
                                                                          0.0,
                                                                          0.0,
                                                                          200.0,
                                                                          100.0),
                                                                    ),
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onVerticalDragUpdate:
                                              (DragUpdateDetails dd) {
                                            print(dd);
                                            setState(() {
                                              top = dd.localPosition.dy;
                                              left = dd.localPosition.dx;
                                            });
                                          },
                                        ),
                                      )
                                    : Container(
                                        height: Get.height * 0.570,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: Logic.bgsgradient,
                                          //color: Logic.bgsColors,
                                          image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Logic.bgsColors,
                                                  BlendMode.color),
                                              image: AssetImage(
                                                  Logic.selectedEffect),
                                              fit: BoxFit.cover),
                                        ),
                                        child: GestureDetector(
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    child: selectedimage.isEmpty
                                                        ? SizedBox()
                                                        : Image(
                                                            image: AssetImage(
                                                                selectedimage),
                                                          )),
                                              ),
                                              Positioned(
                                                top: top,
                                                left: left,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1)),
                                                  child: Opacity(
                                                    opacity: Opacityvalue,
                                                    child: Logic.isGradient
                                                        ? Text(
                                                            textcontroller.text,
                                                            style: fontStyle.copyWith(
                                                                color: newColor,
                                                                fontSize: 30,
                                                                letterSpacing:
                                                                    Spacingvalue,
                                                                shadows: <
                                                                    Shadow>[
                                                                  Shadow(
                                                                    color: Logic
                                                                        .shadowColors,
                                                                    blurRadius:
                                                                        Logic
                                                                            .shadowRadius,
                                                                    offset:
                                                                        Offset(
                                                                      Logic
                                                                          .shadowDx,
                                                                      Logic
                                                                          .shadowDy,
                                                                    ),
                                                                  ),
                                                                ]),
                                                          )
                                                        : Text(
                                                            textcontroller.text,
                                                            style: fontStyle
                                                                .copyWith(
                                                              //color: newColor,
                                                              fontSize: 30,
                                                              letterSpacing:
                                                                  Spacingvalue,
                                                              foreground:
                                                                  Paint()
                                                                    ..shader =
                                                                        newtextgrad
                                                                            .createShader(
                                                                      Rect.fromLTWH(
                                                                          0.0,
                                                                          0.0,
                                                                          200.0,
                                                                          100.0),
                                                                    ),
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onVerticalDragUpdate:
                                              (DragUpdateDetails dd) {
                                            print(dd);
                                            setState(() {
                                              top = dd.localPosition.dy;
                                              left = dd.localPosition.dx;
                                            });
                                          },
                                        ),
                                      )
                            : Container(
                                height: Get.height * 0.570,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Logic.bgsColors,
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Logic.bgsColors, BlendMode.color),
                                        image: AssetImage(Logic.selectedEffect),
                                        fit: BoxFit.cover)),
                                child: GestureDetector(
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                            height: 300,
                                            width: 300,
                                            child: selectedimage.isEmpty
                                                ? SizedBox()
                                                : Image(
                                                    image: AssetImage(
                                                        selectedimage))),
                                      ),
                                      Positioned(
                                        top: top,
                                        left: left,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1)),
                                          child: Opacity(
                                            opacity: Opacityvalue,
                                            child: Logic.isGradient
                                                ? Text(
                                                    textcontroller.text,
                                                    style: fontStyle.copyWith(
                                                        color: newColor,
                                                        fontSize: 30,
                                                        letterSpacing:
                                                            Spacingvalue,
                                                        shadows: <Shadow>[
                                                          Shadow(
                                                            color: Logic
                                                                .shadowColors,
                                                            blurRadius: Logic
                                                                .shadowRadius,
                                                            offset: Offset(
                                                              Logic.shadowDx,
                                                              Logic.shadowDy,
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                : Text(
                                                    textcontroller.text,
                                                    style: fontStyle.copyWith(
                                                      //color: newColor,
                                                      fontSize: 30,
                                                      letterSpacing:
                                                          Spacingvalue,
                                                      foreground: Paint()
                                                        ..shader = newtextgrad
                                                            .createShader(
                                                          Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              200.0,
                                                              100.0),
                                                        ),
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
                  ),
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: TabBar(
                    labelColor: Colors.black,
                    isScrollable: true,
                    tabs: [
                      Tab(icon: Icon(Icons.gamepad), text: 'Logos'),
                      Tab(icon: Icon(Icons.settings), text: 'Settings'),
                      InkWell(
                        onTap: () {
                          dialoguebox(textcontroller);
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
                  height: Get.height * 0.305,
                  child: TabBarView(
                    children: [
                      Logo_screen(callbackfunction: upadateimage),
                      Container(),
                      Text_screen(
                        callbackfunctionForText: changeTextColor,
                        callbackfunctionForTextStyle: changeFontStyle,
                      ),
                      BackGroundImages(
                        callbackfunctionforbgs: changeBgsImage,
                      ),
                      Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 40),
                            child: InkWell(
                                onTap: () async {
                                  final image = await controller.capture();

                                  if (image == null) return null;
                                  await saveImage(image);
                                  Get.snackbar(
                                      'Successfully', 'Saved Image to Gallery',
                                      backgroundColor: Colors.white);
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                          Container(
                            child: InkWell(
                                onTap: () async {
                                  final image = await controller.capture();

                                  if (image == null) return null;
                                  await ShareImage(image).then((value) {});
                                },
                                child: Text(
                                  'Share',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                )),
                          )
                        ],
                      ),
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
                          setState(() {
                            Logic.istextavailable = true;
                            //Logic.isBgs = true;
                            angle = 0.0;
                            allMyText.add(textcontroller.text);
                            print(allMyText);
                          });
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

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');

    final name = 'Screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Future ShareImage(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }
}






