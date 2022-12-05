import 'package:flutter/material.dart';
import 'package:test_project/Model/qr_create.dart';

class QRCode extends StatefulWidget {
  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  late String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ยืนยันการรับอาหาร',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ผลการสแกน QR Code",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "ยังไม่มีข้อมูล",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return qrcreate();
          }));
        },
        child: Icon(Icons.qr_code_sharp),
      ),
    );
  }
}

