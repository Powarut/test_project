import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Member/member_order.dart';
import 'package:test_project/cart/review_cart.dart';
import 'package:test_project/Member/Edit%20Member.dart';
import 'package:test_project/Member/QR%20Code.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/screens/check_out_delivery_details/delivery_details.dart';
import 'package:test_project/welcome_pange.dart';

class DrawerSide extends StatelessWidget {
  final profile = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffd1ad17),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcF9gjzHsADmFvKCSTTAr96wu20WP7rmu_AmmFycnQiqKXCW_rUgGnxyuHsWYfxnhhUK0&usqp=CAU")
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              accountName: Text("M M"),
              accountEmail: Text(profile.email!),
            ),
            SizedBox(height: 20,),
            ListTile(
              trailing: Icon(Icons.shopping_cart,color: textColor),
              title: const Text('รถเข็น',
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReviewCart();
                }));
              },
            ),
            ListTile(
              trailing: Icon(Icons.list_alt_outlined,color: textColor),
              title:  Text('ดูออเดอร์อาหารที่สั่ง',
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MemberOrder();
                }));
              },
            ),
            Container(
              height: 220,
              child: ListTile(
                trailing: Icon(Icons.qr_code,color: textColor),
                title:  Text('QR Code',
                    style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QRCode();
                  }));
                },
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black87,
            ),
            ListTile(
              trailing: Icon(Icons.manage_accounts_outlined,color: textColor),
              title:  Text('จัดการข้อมูลสมาชิก',
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditMember();
                }));
              },
            ),
            ListTile(
              trailing: Icon(Icons.logout,color: textColor),
              title:  Text('ลงชื่อออก', style: TextStyle(fontSize: 16)),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return Homescreen();
                      }));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
