import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_project/Data/DataRider.dart';
import 'package:test_project/Rider/LoginRider.dart';
import 'package:test_project/constants/color.dart';

class RiderRegister extends StatefulWidget {
  @override
  State<RiderRegister> createState() => _RiderRegisterState();
}

class _RiderRegisterState extends State<RiderRegister> {
  final formKey = GlobalKey<FormState>();
  Rider Riprofile = Rider();
  //เตรียม Firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _Riprofile =
      FirebaseFirestore.instance.collection("Rider");

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("Rider")
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
                backgroundColor: riderColor,
                title: Text("สร้างบัญชีผู้ใช้ของพนักงานส่ง"),
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
                              Riprofile.riEmail = email;
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
                              Riprofile.riPwd = pwd;
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
                              Riprofile.riName = name;
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
                              Riprofile.riSurname = surname;
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
                              Riprofile.riTel = tel;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(riderColor),
                              ),
                              child: Text(
                                "ลงทะเบียน",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try {
                                    await _Riprofile.add({
                                      "UserEmail": Riprofile.riEmail,
                                      "UserPasword": Riprofile.riPwd,
                                      "UserName": Riprofile.riName,
                                      "UserSurname": Riprofile.riSurname,
                                      "UserTel": Riprofile.riTel
                                    });
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: Riprofile.riEmail.toString(),
                                            password:
                                                Riprofile.riPwd.toString())
                                        .then((value) {
                                      formKey.currentState!.reset();
                                      Fluttertoast.showToast(
                                          msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                          gravity: ToastGravity.TOP);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return RiderLogin();
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
