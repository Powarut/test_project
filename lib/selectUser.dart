import 'package:flutter/material.dart';
import 'package:test_project/Member/LoginMember.dart';
import 'package:test_project/Owner/LoginOwner.dart';
import 'package:test_project/Rider/LoginRider.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/widgets/add_item.dart';



class selectUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/images/logobrand2.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ยินดีต้อนรับ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "กรุณาเลือกประเภทผู้ใช้",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "ในการเข้าใช้งานโปรแกรม",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(memberColor),
                    ),
                    icon: Icon(Icons.people_alt_outlined),
                    label: Text("ลูกค้า", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MemberLogin();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(riderColor),
                    ),
                    icon: Icon(Icons.delivery_dining),
                    label: Text("พนักงานส่ง", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RiderLogin();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ownerColor),
                    ),
                    icon: Icon(Icons.restaurant),
                    label: Text("เจ้าของร้าน", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OwnerLogin();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.delivery_dining),
                    label: Text("หน้าทดสอบ", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddItem();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
