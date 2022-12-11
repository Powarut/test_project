import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/screens/check_out_delivery_details/payment_summary/order_item.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentTypes {
  Cash,
  online,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  PaymentTypes? _paymentTypes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text(
          "สรุปยอดชำระ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("รวมยอดชำระ"),
        subtitle: Text(
          "300 \rบาท",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "ยืนยันการสั่ง",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: memberColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index){
            return Column(
              children: [
                ListTile(
                  title: Text("สมพงษ์ คำเหล่า"),
                  subtitle: Text("56/3 อ.เมืองเอก ต.หลักหก จ.ปทุมธานี 22140 \r0988641234"),
                ),
                Divider(),
                ExpansionTile(
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                  title: Text("รายการอาหาร 7"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "รวมทั้งหมด",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing:  Text(
                      "200 \rบาท",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "ส่วนลด",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing:  Text(
                    "200 \rบาท",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "ส่วนลด",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing:  Text(
                    "60 \rบาท",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("เลือกช่องทางชำระเงิน"),
                ),
                RadioListTile(
                  value: PaymentTypes.Cash,
                  groupValue: _paymentTypes,
                  title: Text("เงินสด"),
                  onChanged: (value) {
                    setState(() {
                      _paymentTypes = value;
                    });
                  },
                  secondary: Icon(
                    Icons.local_atm_outlined,
                    color: memberColor,
                  ),
                ),
                RadioListTile(
                  value: PaymentTypes.online,
                  groupValue: _paymentTypes,
                  title: Text("โอนผ่านธนาคาร"),
                  onChanged: (value) {
                    setState(() {
                      _paymentTypes = value;
                    });
                  },
                  secondary: Icon(
                    Icons.atm_outlined,
                    color: memberColor,
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
