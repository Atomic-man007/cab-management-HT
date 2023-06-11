import 'package:cab_management/firebase_options.dart';
import 'package:cab_management/screens/auth/signup_screen.dart';
import 'package:cab_management/screens/home/home_screen.dart';
import 'package:cab_management/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, _) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: false,
          ),
          home: StreamBuilder(
            stream: AuthService().firebaseAuth.authStateChanges(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const SignUpScreen();
            },
          ));
    });
  }
}
