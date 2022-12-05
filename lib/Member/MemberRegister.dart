import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_project/Data/DataMember.dart';


class MemberRegister extends StatefulWidget {
  @override
  State<MemberRegister> createState() => _MemberRegisterState();
}

class _MemberRegisterState extends State<MemberRegister> {
  final formKey = GlobalKey<FormState>();
  Member profile = Member();
  //เตรียม Firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _profile = FirebaseFirestore.instance.collection("Member");

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("Member")
        .doc("docID")
        .get();
  }

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
                title: Text("สร้างบัญชีผู้ใช้ของลูกค้า"),
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
                          Image.asset("assets/images/logoregister.png"),
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
                            height: 15,
                          ),
                          Text("ชิ่อ", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator:
                                RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                            onSaved: (String? name) {
                              profile.name = name;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("นามสกุล", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนนามสกุล"),
                            onSaved: (String? surname) {
                              profile.surname = surname;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("เบอร์โทรศัพท์", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนเบอร์โทรศัพท์"),
                            onSaved: (String? tel) {
                              profile.tel = tel;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text(
                                "ลงทะเบียน",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try {
                                    await _profile.add({
                                      "UserEmail":profile.email,
                                      "UserPasword":profile.pwd,
                                      "UserName":profile.name,
                                      "UserSurname":profile.surname,
                                      "UserTel":profile.tel
                                    });
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: profile.email.toString(),
                                            password: profile.pwd.toString())
                                        .then((value) {
                                      formKey.currentState!.reset();
                                      Fluttertoast.showToast(
                                          msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                          gravity: ToastGravity.TOP);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MemberRegister();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(e.code);
                                    String message;
                                    if (e.code == 'email-already-in-use') {
                                      message =
                                          "มีอีเมล์นี้ในระบบแล้ว โปรดใช้อีเมล์อื่นแทน";
                                    } else if (e.code == 'weak-password') {
                                      message =
                                          "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                    }
                                    Fluttertoast.showToast(
                                        msg: e.message.toString(),
                                        gravity: ToastGravity.CENTER);
                                  }
                                }
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
