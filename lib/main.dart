import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/firebase_options.dart';
import 'package:untitled3/screens/about/about_screen.dart';
import 'package:untitled3/screens/login/login_screen.dart';
import '/screens/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing debugbanner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: FutureBuilder(
        // Check for the current user during app startup
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
                MyGlobals().log_account = true;
              return const HomeScreen(); // User is logged in
            } else {
              return HomeScreen(); // User is not logged in
            }
          } else {
            return about_screen(); // Loading state
          }
        },
      ),
    );
  }
}
