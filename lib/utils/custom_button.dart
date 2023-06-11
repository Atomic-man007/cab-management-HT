import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.isLoading = false})
      : super(key: key);
  final String buttonText;
  final VoidCallback onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(50.r)),
        child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Text(
                    buttonText,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  )),
      ),
    );
  }
}
