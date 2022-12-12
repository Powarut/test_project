import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Data/food.dart';
import 'package:test_project/Model/upload_Imadge.dart';
import 'package:test_project/constants/color.dart';

class Ow_create extends StatefulWidget {

  @override
  State<Ow_create> createState() => _Ow_createState();
}

class _Ow_createState extends State<Ow_create> {
  final formKey =GlobalKey<FormState>();
  final foodName = TextEditingController();
  final foodType = TextEditingController();
  final foodPrice = TextEditingController();
  final foodNum = TextEditingController();


  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _Foodcollection = FirebaseFirestore.instance.collection("Food");

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
                backgroundColor: ownerColor,
                title: Text('สร้างเมนูอาหาร'),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        PictureIcon(),
                        textHeader(),
                        SizedBox(
                          height: 15,
                        ),
                        textFormF('ชื่อ', 'กรุณาตั้งชื่อเมนูอาหาร', foodName),
                        textFormF(
                            'ประเภท', 'กรุณาตั้งประเภทเมนูอาหาร', foodType),
                        textFormF('ราคา', 'กรุณาตั้งราคา', foodPrice),
                        textFormF('จำนวน', 'กรุณาระบุจำนวน', foodNum),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text(
                                    'เพิ่มเมนู',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async{
                                    if(formKey.currentState!.validate()){
                                      formKey.currentState!.save();
                                      await _Foodcollection.add({
                                        "FoodName":foodName.text,
                                        "Foodtype":foodType.text,
                                        "FoodPrice":foodPrice.text,
                                        "FoodNum":foodNum.text,
                                      });
                                      formKey.currentState!.reset();
                                    }
                                    Navigator.pop(context,DataFood);
                                  }),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text(
                                    'ยกเลิก',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    formKey.currentState!.reset();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Padding textHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'สร้างเมนูอาหาร',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.amber,
        ),
      ),
    );
  }

  Padding textFormF(
      String lText, String hText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lText,
          hintText: hText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(Icons.add_a_photo_outlined,size: 50,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return uploadImage();
              }));
        },
      ),
    );
  }
  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("Food")
        .doc()
        .get();
  }
}
