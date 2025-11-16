import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPassword; // جديد

  const CustomTextField({
    super.key,
    this.hintText,
    this.focusNode,
    this.textInputType,
    this.validator,
    this.controller,
    this.isPassword = false, // افتراضي false
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 16, height: 1.2),

      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: 'NeoLatina',
          color: Color(0xFF3671AA),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 3, color: Color(0xFF3671AA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 3, color: Color(0xFF3671AA)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF3671AA)),
        ),
      suffixIcon: widget.isPassword
    ? Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xFF3671AA),
            size: 22, // أصغر شوي ليضبط المقاس
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      )
    : null,

      ),
      validator: widget.validator,
    );
  }
}
