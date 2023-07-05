import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Widget icon;
  final void Function(String val)? onChanged;
  final TextEditingController controller;
  final bool? obscure;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const Textfield({
    required this.hintStyle,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.onChanged,
    this.obscure,
    required this.textInputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscure ?? false,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          // fillColor: const Color(0xffFFFFFF),
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: icon,
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15, left: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEBEBEC),
            ),
          ),
          //  focusedBorder: OutlineInputBorder(borderSide: )
        ),
      ),
    );
  }
}
