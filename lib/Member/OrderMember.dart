import 'package:flutter/material.dart';
import 'package:test_project/Member/Order_detail_mem.dart';
import 'package:test_project/constants/color.dart';

class OrderMember extends StatefulWidget {
  @override
  State<OrderMember> createState() => _OrderMemberState();
}

class _OrderMemberState extends State<OrderMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text("ออเดอร์อาหารที่สั่ง"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int index){
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(
                leading: Text("สำเร็จ",style: TextStyle(color: Colors.green),),
                title: Text("Er5l6HrLbRnMX4fmHenb"),
                subtitle: Text("วันที่:10/11/2022 "+"\r เวลา: 15:05"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Order_detail_mem();
                  }));
                },
              ),
            );
          }
      ),
    );
  }
}
