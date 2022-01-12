import 'package:flutter/material.dart';
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 10,
      child: Slider(
        value: _currentSliderValue,
        max: 150,


        activeColor: Colors.black,
        onChanged: (double value){
          setState(() {
            _currentSliderValue = value;
          });

        },
      ),
    );
  }
}
