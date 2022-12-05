import 'package:flutter/material.dart';

class orderfinish extends StatefulWidget {
  const orderfinish({Key? key}) : super(key: key);

  @override
  State<orderfinish> createState() => _orderfinishState();
}

class _orderfinishState extends State<orderfinish> {
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
                      return orderFinnish();
                    }));
                  },
                ),
              );
            }
        )
    );
  }
}
class orderFinnish extends StatefulWidget {
  const orderFinnish({Key? key}) : super(key: key);

  @override
  State<orderFinnish> createState() => _orderFinnishState();
}

class _orderFinnishState extends State<orderFinnish> {
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
                          "สถานะ: ส่งสำเร็จ ",
                          style: TextStyle(color:Colors.greenAccent,fontSize: 20),
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
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}


