import 'package:cab_management/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/driver_info_services.dart';
import '../../utils/custom_button.dart';

class AddDriverInfo extends StatefulWidget {
  const AddDriverInfo({Key? key}) : super(key: key);

  @override
  State<AddDriverInfo> createState() => _AddDriverInfoState();
}

class _AddDriverInfoState extends State<AddDriverInfo> {
  DriverInfoService driverInfoService = DriverInfoService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _driverIdNumberController =
      TextEditingController();
  final TextEditingController _driverEmailController = TextEditingController();
  final TextEditingController _driverPhoneNumberController =
      TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black, // Set the color of the drawer icon here
        ),
        elevation: 0,
        title: const Text(
          "Add Driver",
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                    hintText: "Driver Name",
                    controller: _driverNameController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Driver Name" : null),
                CustomTextField(
                    hintText: "Driver ID Number",
                    controller: _driverIdNumberController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Driver ID number" : null),
                CustomTextField(
                    hintText: "Driver Email",
                    controller: _driverEmailController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Driver Email" : null),
                CustomTextField(
                    hintText: "Driver Phone Number",
                    controller: _driverPhoneNumberController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter Driver Phone Number" : null),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: CustomButton(
              buttonText: 'Submit',
              isLoading: _isLoading,
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });

                  await driverInfoService.addDriver(
                    driverName: _driverNameController.text,
                    driverIdNumber: _driverIdNumberController.text,
                    driverEmail: _driverEmailController.text,
                    driverPhoneNumber: _driverPhoneNumberController.text,
                  );

                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
