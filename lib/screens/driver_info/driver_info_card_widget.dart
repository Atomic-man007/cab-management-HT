import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/driver_info_services.dart';

class DriverInfoCardWidget extends StatefulWidget {
  const DriverInfoCardWidget({
    Key? key,
    required this.driverDetails,
    required this.index,
  }) : super(key: key);

  final List<QueryDocumentSnapshot> driverDetails;
  final int index;

  @override
  State<DriverInfoCardWidget> createState() => _DriverInfoCardWidgetState();
}

class _DriverInfoCardWidgetState extends State<DriverInfoCardWidget> {
  DriverInfoService driverInfoService = DriverInfoService();

  void showDeleteConfirmationDialog(BuildContext context, String documentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete this driver?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deleteDriver function
                driverInfoService.deleteDriver(documentId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const NetworkImage(
                  "https://s3.coinmarketcap.com/static-gravity/image/dffd4ef08f3d4f4b9c40c40b9f1e7771.jpeg",
                ),
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.driverDetails[widget.index].get("driverIdNumber"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    widget.driverDetails[widget.index].get("driverName"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    widget.driverDetails[widget.index].get("driverEmail"),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    widget.driverDetails[widget.index].get("driverIdNumber"),
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
              PopupMenuButton<String>(
                onSelected: (String value) {
                  if (value == 'edit') {
                    // // Perform edit action
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EditDriverPage(),
                    //   ),
                    // );
                  } else if (value == 'delete') {
                    // Perform delete action
                    showDeleteConfirmationDialog(context, widget.driverDetails[widget.index].id);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),

                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
