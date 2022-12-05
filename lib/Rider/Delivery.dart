import 'package:flutter/material.dart';
import 'package:test_project/Rider/gps.dart';

class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, int index){
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                child: ListTile(
                  title: Text("รหัสบิล"),
                  subtitle: Text("วันที่:10/11/2022 "+"\r เวลา: 15:05"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Delivery();
                    }));
                  },
                ),
              );
            }
        )
    );
  }
}

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
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
                          "สถานะ: จัดส่ง ",
                          style: TextStyle(color:Colors.black38,fontSize: 20),
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
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("เริ่มการจัดส่ง",
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return gps();
                                    }));
                              },
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

