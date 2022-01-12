import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logo_maker/Views/create_screen.dart';

class Logo_screen extends StatefulWidget {
  final selectedimage;
  final Function callbackfunction;

  const Logo_screen(
      {Key? key, this.selectedimage, required this.callbackfunction})
      : super(key: key);

  @override
  _Logo_screenState createState() => _Logo_screenState();
}

class _Logo_screenState extends State<Logo_screen> {
  List<String> logos = [
    'assets/ninja.jpg',
    'assets/images.png',
    'assets/images (1).png',
    'assets/sher.png',
    'assets/fox.jpg',
  ];

//  String selectedimage = 'assets/ninja.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700,
              width: 500,
              child: GridView.builder(
                  itemCount: logos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 90),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        selectedimage = logos[i];

                        widget.callbackfunction();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage(logos[i]),fit: BoxFit.cover,
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
