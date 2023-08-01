import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti/LoginScreen.dart';
import 'package:iti/SignScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:firebase_user(),
    );
  }
}


