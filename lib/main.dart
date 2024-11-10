import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/auth/login.dart';
import 'package:login/constants/theme.dart';
import 'package:login/provider/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyChnYC-C3PNcKHEgRQIlU8yd3nnXShFJm0",
        appId: "1:585073911343:android:f67589ed0629b5b47fc8da",
        messagingSenderId: "585073911343",
        projectId: "authloginsignin"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: const LoginPage(),
    ),
    );
  }
}
