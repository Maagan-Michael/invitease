import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key,required this.func,required this.text, this.color = Colors.blue}) : super(key: key);
final Function func;
final String text;
final Color color;


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool buttonHovered = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return  InkWell(
      onTap:() =>widget.func(),
      hoverColor: Colors.transparent,
      onHover: (hovered){
        buttonHovered = hovered;
        setState(() {
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        color:buttonHovered?Colors.orangeAccent[100]: widget.color,
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          width: width * 0.2,
          height: height * 0.1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              widget.text,
              textDirection: ui.TextDirection.rtl,
              style: TextStyle(color:Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
