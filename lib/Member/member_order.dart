import 'package:flutter/material.dart';
import 'package:test_project/Member/member_order_detail.dart';
import 'package:test_project/constants/color.dart';

class MemberOrder extends StatefulWidget {
  @override
  State<MemberOrder> createState() => _MemberOrderState();
}

class _MemberOrderState extends State<MemberOrder> {
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
                    return MemberOrderDetail();
                  }));
                },
              ),
            );
          }
      ),
    );
  }
}
