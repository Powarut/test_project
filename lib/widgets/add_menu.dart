import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/Model/upload_Imadge.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/constants/costom_text_field.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var selectMenu;
  var imageUrl;
  var imageFile;
  void _imageFromGallery()async{
    var pickedFile=await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile=File(pickedFile!.path);
    });
  }

  void _imageFromCamera()async{
    var pickedFile=await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile=File(pickedFile!.path);
    });
  }

  void _showPicker(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return SafeArea(child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text("กล้อง"),
                  onTap: (){
                _imageFromCamera();
                Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.browse_gallery),
                  title: new Text("อัลบั้ม"),
                  onTap: (){
                      _imageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          );
        });
  }

  Widget imageSection(){
    return (imageFile==null)?InkWell(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        height: 50.0,
        width: 300.0,
        margin: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
        decoration: BoxDecoration(
          color: ownerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "เพิ่มรูปภาพ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ):Container(
      height: 50.0,
      width: 50.0,
      child: Image.file(imageFile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มเมนูอาหาร"),
        backgroundColor: ownerColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            menuFields("ตั้งชื่ออาหาร", "ชื่อ", nameController),
            SizedBox(
              height: 15,
            ),
            menuFields("ตั้งราคา", "ราคา", priceController),
            imageSection(),
            InkWell(
              onTap: () async{
                await uploadImage();
                await uploadMenu();
              },
              child: Container(
                height: 50.0,
                width: 300.0,
                margin: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                decoration: BoxDecoration(
                  color: ownerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "บันทึกเมนูอาหาร",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuFields(hint, label, controllers) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
      child: TextField(
        controller: controllers,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
          label: Text(label),
        ),
      ),
    );
  }
  Future UploadImage()async{
    User? user = await FirebaseAuth.instance.currentUser;
    Reference reference =await FirebaseStorage.instance.ref().child(user!.uid);
    UploadTask task = reference.putFile(imageFile);
    TaskSnapshot snapshot=await task;
    imageUrl=await snapshot.ref.getDownloadURL();
    setState(() {

    });
    print(imageUrl);
  }
  Future uploadMenu()async{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Transform.scale(
          scale: 0.1,
          child: CircularProgressIndicator(
            backgroundColor: Colors.greenAccent,
          ),
        );
      }
    );
    await uploadImage();
    User? user = await FirebaseAuth.instance.currentUser;
    if(nameController.text==null||priceController.text==null||selectMenu==null||imageUrl==null){
      Fluttertoast.showToast(msg: "โปรดใส่กรอกข้อมูลให้ครบ");
    }else{
      FirebaseFirestore.instance.collection("Food").doc(user!.uid).set({
        "FoodName":nameController.text,
        "FoodPrice":priceController.text,
        "FoodId":user.uid,
        "FoodImage":imageUrl,
      }).then((value) => {
        Fluttertoast.showToast(msg: "เพิ่มเมนูสำเร็จเรียบร้อย")
      });
      Navigator.of(context).pop();
    }
  }
}
