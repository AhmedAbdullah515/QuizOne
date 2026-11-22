import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapplication/Providers/authprovider.dart';
import 'package:weatherapplication/Screens/loginpage.dart';
import 'package:weatherapplication/Screens/signupPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Authprovider(),)],

      child:  MaterialApp(
        home:Loginpage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
