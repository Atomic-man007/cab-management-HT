import 'package:cab_management/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_button.dart';

class AddCabInfo extends StatefulWidget {
  const AddCabInfo({Key? key}) : super(key: key);

  @override
  State<AddCabInfo> createState() => _AddCabInfoState();
}

class _AddCabInfoState extends State<AddCabInfo> {
  final TextEditingController _cabRGNumberController = TextEditingController();
  final TextEditingController _cabModelController = TextEditingController();
  final TextEditingController _cabColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black, // Set the color of the drawer icon here
        ),
        elevation: 0,
        title: const Text(
          "Add Cab Info",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              hintText: "Cab Registration Number",
              controller: _cabRGNumberController),
          CustomTextField(
              hintText: "Cab Model", controller: _cabModelController),
          CustomTextField(
              hintText: "Driver Email", controller: _cabColorController),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: CustomButton(
              buttonText: 'Submit',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
