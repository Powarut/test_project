import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/product_provider.dart';
import 'package:test_project/welcome_pange.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}