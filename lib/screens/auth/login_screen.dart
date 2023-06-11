import 'package:cab_management/screens/home/home_screen.dart';
import 'package:cab_management/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30.h,
            ),
            isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (emailController.text == "" ||
                              passwordController == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("All feilds are required"),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            User? result = await AuthService().login(
                                emailController.text, passwordController.text);
                            if (result != null) {
                              print(result.email);

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                  (route) => false);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.bold),
                        ))),
          ],
        ),
      ),
    );
  }
}
