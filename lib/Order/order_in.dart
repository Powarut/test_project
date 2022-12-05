import 'package:flutter/material.dart';
import 'package:test_project/Order/detail_order.dart';

class orderIN extends StatefulWidget {
  const orderIN({Key? key}) : super(key: key);

  @override
  State<orderIN> createState() => _orderINState();
}

class _orderINState extends State<orderIN> {
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
                    return detailOrder();
                  }));
                },
              ),
            );
          }
      )
    );
  }
}
