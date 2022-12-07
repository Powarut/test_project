import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Member/MemberLogin.dart';
import 'package:test_project/constants/color.dart';

class EditMember extends StatefulWidget {
  @override
  State<EditMember> createState() => _EditMemberState();
}

class _EditMemberState extends State<EditMember> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = " ";
  final newPasswordController = TextEditingController();

  @override
  void disposr(){
    newPasswordController.dispose();
    super.dispose();
  }
  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword()async{
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MemberLogin(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text('กำลังเปลี่ยนรหัสผ่านใหม่ของคุณ โปรดรอสักครู่...'),
      ),
      );
    }catch (error){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: memberColor,
        elevation: 0,
        title: Text(
          'จัดการข้อมูลสมาชิก',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่านใหม่',
                    hintText: 'กรุณป้อนรหัสผ่านใหม่',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.black26, fontSize: 15.0),
                  ),
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่รหัสผ่าน';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'ยืนยันรหัสผ่านใหม่อีกครั้ง',
                    hintText: 'กรุณาป้อนรหัสผ่านใหม่',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.black26, fontSize: 15.0),
                  ),
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่รหัสผ่าน';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(memberColor),
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      newPassword = newPasswordController.text;
                    });
                    changePassword();
                  }
                },
                child: Text(
                  'บันทึก',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
