import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/check_out_provider.dart';
import 'package:test_project/providers/product_provider.dart';
import 'package:test_project/providers/reviewcart_provider.dart';
import 'package:test_project/providers/user_provider.dart';
import 'package:test_project/selectUser.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
            create: (context)=>ProductProvider(),
          ),
          ChangeNotifierProvider<User_provider>(
            create: (context) =>User_provider(),
          ),
          ChangeNotifierProvider<ReviewCartProvider>(
            create: (context) =>ReviewCartProvider(),
          ),
          ChangeNotifierProvider<CheckoutProvider>(
            create: (context) =>CheckoutProvider(),
          ),
        ],
        child: MaterialApp(
              debugShowCheckedModeBanner: false,
          home: selectUser(),
        ),
    );
  }
}
