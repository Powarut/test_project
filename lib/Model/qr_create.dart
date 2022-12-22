import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:test_project/constants/color.dart';

class qrcreate extends StatefulWidget {
  const qrcreate({Key? key}) : super(key: key);

  @override
  State<qrcreate> createState() => _qrcreateState();
}

class _qrcreateState extends State<qrcreate> {
  String data = "";
  String orderID="123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        centerTitle: true,
        title: Text(
          'แสดง QR Code',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: QrImage(
                  data: data,
                  backgroundColor: Colors.black12,
                  size: 300.0,
                ),
              ),
              SizedBox(height: 24,),
              Container(
                width: 300.0,
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      data = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: orderID,
                    filled: true,
                    fillColor: Colors.black26,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              // RawMaterialButton(
              //     onPressed: (){},
              //   fillColor: memberColor,
              //   shape: StadiumBorder(),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 36.0,
              //     vertical: 26.0,
              //   ),
              //   child: Text(
              //     "แสดง QR Code"
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
