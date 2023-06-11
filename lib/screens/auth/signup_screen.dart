import 'package:cab_management/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/auth_service.dart';
import '../home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            TextFormField(
              controller: confirmEmailController,
              decoration: const InputDecoration(
                  labelText: "Confirm Email", border: OutlineInputBorder()),
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
                          Fluttertoast.showToast(
                              msg: "All feilds are required");
                          setState(() {
                            isLoading = false;
                          });
                          return;
                        } else if (passwordController.text !=
                            confirmEmailController.text) {
                          Fluttertoast.showToast(
                              msg: "password does not match");
                          return;
                        } else {
                          User? result = await AuthService().register(
                              emailController.text, passwordController.text);
                          if (result != null) {
                            print("success");
                            print(result.email);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text("Already have an account? Login here"))
          ],
        ),
      ),
    );
  }
}
