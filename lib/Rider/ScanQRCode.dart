import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQRCode extends StatefulWidget {
  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  late String scanresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Scan QR Code',
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
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner_sharp),
      ),
    );
  }
  startScan()async{
    //อ่านข้อมูลจาก บาร์โค้ดและคิวอาร์โค้ด
    String? cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult!;
    });
  }
}
