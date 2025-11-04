import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  FocusNode? focusNode;
  TextInputType? textInputType;
  String? Function(String?)? validator;
   TextEditingController? controller;
  CustomTextField({
    super.key,
    this.hintText,
    this.focusNode,
    this.textInputType,
    this.validator,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // backgroundColor:Colors.white10
controller: controller,
      keyboardType:
          //  textInputType !=null?textInputType:TextInputType.text,
          textInputType ?? TextInputType.text,
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 3, color: Color(0xFF3671AA)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFF3671AA)),
        ),
      ),
       validator: validator,
    );
  }
}
