import 'package:flutter/material.dart';
class Heading extends StatelessWidget {
  const Heading({super.key,required this.type,required this.text});
  final int type;
  final String text;
  @override
  Widget build(BuildContext context) {
    if (type == 1){
      return Text(text,style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700),);
    }
    else if (type == 2){
      return Text(text,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),);
    }
    return Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);

  }
}
