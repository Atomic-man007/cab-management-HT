import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverInfoCardWidget extends StatelessWidget {
  const DriverInfoCardWidget({
    super.key,
    required this.driverDetails,
    required this.index,
  });

  final List<QueryDocumentSnapshot> driverDetails;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const NetworkImage(
                    "https://s3.coinmarketcap.com/static-gravity/image/dffd4ef08f3d4f4b9c40c40b9f1e7771.jpeg"),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driverDetails[index].get("driverIdNumber"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    driverDetails[index].get("driverName"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    driverDetails[index].get("driverEmail"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    driverDetails[index].get("driverIdNumber"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "BMW",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.more_vert,
                size: 30.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}
