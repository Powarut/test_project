import 'package:flutter/material.dart';
import 'package:test_project/Owner/HomeOwner.dart';

class orderdelivery extends StatefulWidget {
  const orderdelivery({Key? key}) : super(key: key);

  @override
  State<orderdelivery> createState() => _orderdeliveryState();
}

class _orderdeliveryState extends State<orderdelivery> {
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
                      return orderDelivery();
                    }));
                  },
                ),
              );
            }
        )
    );
  }
}
class orderDelivery extends StatefulWidget {
  const orderDelivery({Key? key}) : super(key: key);

  @override
  State<orderDelivery> createState() => _orderDeliveryState();
}

class _orderDeliveryState extends State<orderDelivery> {
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
                          "สถานะ: เตรียมอาหาร ",
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
                              label: Text("จัดส่ง",
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomeOwner();
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

