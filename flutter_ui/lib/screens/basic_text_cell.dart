import 'package:flutter/material.dart';



class BasicTextCell extends StatelessWidget {
  const BasicTextCell({Key? key,required this.text,this.color = Colors.transparent, required this.width}) : super(key: key);
final Color color;
final String text;
final double width;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    return Container(
      width: width,
      height: height *0.1,
      color: color ,
      alignment: Alignment.center,
      child: SelectableText(text),
    );
  }
}
