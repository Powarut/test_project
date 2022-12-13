import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_project/Data/DataMember.dart';
import 'package:test_project/Member/HomeMember.dart';
import 'package:test_project/Member/MemberRegister.dart';
import 'package:test_project/ProductModle/Hometest.dart';
import 'package:test_project/constants/color.dart';

class MemberLogin extends StatefulWidget {
  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  final formKey = GlobalKey<FormState>();
  Member profile = Member();
  //เตรียม Firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: memberColor,
                title: Text("เข้าสู่ระบบในฐานะลูกค้า"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/logobrand2.png"),
                          Text("อีเมล์", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              EmailValidator(
                                  errorText: "รูปแบบอีเมล์ไม่ถูกต้อง"),
                              RequiredValidator(errorText: "กรุณาป้อนอีเมล์")
                            ]),
                            onSaved: (String? email) {
                              profile.email = email;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนรหัสผ่าน"),
                            onSaved: (String? pwd) {
                              profile.pwd = pwd;
                            },
                            obscureText: true,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(memberColor),
                              ),
                              icon: Icon(Icons.login),
                              label: Text(
                                "เข้าสู่ระบบ",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: profile.email.toString(),
                                            password: profile.pwd.toString())
                                        .then((value) {
                                      formKey.currentState!.reset();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return HomeMember();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                        msg: e.message.toString(),
                                        gravity: ToastGravity.CENTER);
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(memberColor),
                              ),
                              icon: Icon(Icons.card_membership_outlined),
                              label: Text("สร้างบัญชีผู้ใช้",
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MemberRegister();
                                }));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
