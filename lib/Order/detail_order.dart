import 'package:flutter/material.dart';
import 'package:test_project/Owner/HomeOwner.dart';

class detailOrder extends StatefulWidget {
  const detailOrder({Key? key}) : super(key: key);

  @override
  State<detailOrder> createState() => _detailOrderState();
}

class _detailOrderState extends State<detailOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text(
          'รายละเอียดออเดอร์',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "สถานะ: รอรับออเดอร์ ",
                          style: TextStyle(color:Colors.black26,fontSize: 20),
                        ),
                      ),
                      Text(
                        "หมายเลขบิล",
                        style: TextStyle(fontSize: 25),
                      ),
                      Center(
                        child: Text(
                          "ชื่อ : "+"\r นามสกุล: ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        "เบอร์โทรศัพท์",
                        style: TextStyle(fontSize: 25),
                      ),
                      Center(
                        child: Text(
                          "087-123xxxx",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "สถานที่จัดส่ง",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "รายละเอียดพิกัด",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "รายการอาหาร",
                        style: TextStyle(fontSize: 25),
                      ),

                      Center(
                        child: Text(
                          "ชื่ออาหาร "+"\r จำนวน ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "ราคาทั้งหมด : "+"\rบาท",
                        style: TextStyle(fontSize: 25),
                      ),

                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("รับออเดอร์",
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomeOwner();
                                    }));
                              },
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
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
