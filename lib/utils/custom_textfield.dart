import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.onChanged,
      this.validator})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade600)),
      ),
    );
  }
}
