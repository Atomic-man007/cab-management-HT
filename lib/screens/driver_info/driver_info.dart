import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_driver_info.dart';
import 'driver_info_card_widget.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
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
        title: Text(
          "Driver",
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
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
      body: Padding(
        padding: EdgeInsets.all(10.0.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddDriverInfo()));
                  },
                  child: const Text(
                    "+Add Driver",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Add_driver_Details_table")
                    .snapshots(),
                builder: (context, snapshot) {
                  List<QueryDocumentSnapshot> driverDetails =
                      snapshot.data!.docs;
                  return driverDetails.isEmpty
                      ? Center(child: Text("Drivers Not Found"))
                      : Expanded(
                          child: ListView.separated(
                            itemCount: driverDetails.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return DriverInfoCardWidget(
                                  driverDetails: driverDetails, index: index);
                            },
                          ),
                        );
                })
          ],
        ),
      ),
    );
  }
}
