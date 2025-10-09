import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  FocusNode? focusNode;
  TextInputType? textInputType;
  CustomTextField({super.key, this.hintText, this.focusNode,this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Container(
      // backgroundColor:Colors.white10
      child: TextField(
        keyboardType:
        //  textInputType !=null?textInputType:TextInputType.text,
        textInputType??TextInputType.text,
        focusNode: focusNode,
        decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'NeoLatina', color: Color(0xFF3671AA)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Color(0xFF3671AA)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF3671AA)),
          ),
        ),
      ),
    );
  }
}
