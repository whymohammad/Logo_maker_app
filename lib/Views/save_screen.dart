import 'dart:typed_data';

import 'package:flutter/material.dart';
class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 290),
            child:Center(child: Text('nO IMAGES SAVED'))
          )
        ],
      ),
    );
  }


}
