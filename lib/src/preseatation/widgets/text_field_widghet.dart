import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? isObscureChacaracter;
  final String? hintText;
  final String? labelText;

  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.isObscureText = false,
    this.isObscureChacaracter = '*',
    this.hintText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      onTap: () {},
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText ?? false,
      obscuringCharacter: isObscureChacaracter ?? '*',
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        constraints: BoxConstraints(
          minHeight: height * 0.065,
          minWidth: width,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}
