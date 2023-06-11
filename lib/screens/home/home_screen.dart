import 'package:cab_management/screens/driver_info/driver_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.grey, // Set the color of the drawer icon here
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: const NetworkImage(
                    "https://s3.coinmarketcap.com/static-gravity/image/dffd4ef08f3d4f4b9c40c40b9f1e7771.jpeg"),
              ),
            )
          ],
        ),
        body: Center(
            child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DriverInfo()));
          },
          child: const Text("Home Screen"),
        )),
        drawer: Drawer(
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              drawerItems(title: 'Home', onTap: () {}),
              drawerItems(
                  title: 'Driver Info',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DriverInfo()));
                  }),
              drawerItems(title: 'Cab Info', onTap: () {}),

              // Add more drawer items here
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItems({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        color: Colors.grey.shade200,
        child: ListTile(title: Text(title), onTap: onTap),
      ),
    );
  }
}
