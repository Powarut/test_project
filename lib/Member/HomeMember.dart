import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/welcome_pange.dart';
import 'package:test_project/Member/Edit%20Member.dart';
import 'package:test_project/Member/QR%20Code.dart';
import 'package:test_project/Model/cart_modle.dart';


class HomeMember extends StatefulWidget {

  final Stream<QuerySnapshot> Food =
      FirebaseFirestore.instance.collection('Food').snapshots();
  @override
  State<HomeMember> createState() => _HomeMemberState();
}

class _HomeMemberState extends State<HomeMember> {
  final profile = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          title: Text(
            'ชื่อลูกค้า',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Badge(
                  badgeContent: Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Food").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                            height: 80,
                            width: 100,
                            image: NetworkImage(document['FoodImage'])),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            document["FoodName"] + " " + r" ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            document["FoodPrice"] + "\rบาท",
                            style: TextStyle(
                                fontSize: 16 ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => null,
                          icon: Icon(
                            Icons.add_circle,
                          ),
                        ),
                      ],
                    ));
              }).toList(),
            );
          },
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logobrand2.png')),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  accountName: Text("M M"),
                  accountEmail: Text("member@hotmail.com"),
                ),
                ListTile(
                  title: const Text('จัดการข้อมูลสมาชิก',
                      style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditMember();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('ยืนยันการรับอาหาร',
                      style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QRCode();
                    }));
                  },
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black87,
                ),
                ListTile(
                  title: const Text('ลงชื่อออก', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    profile.signOut().then((value) {
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
        ),
      ),
    );
  }
/////// add to cart//////
  List<CartModIe> cartList=[];
  List<CartModIe> newCartList=[];
  late CartModIe cartModIe;
  void addtoCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }){
    cartModIe = CartModIe(
        image: image,
        name: name,
        price: price,
        quantity: quantity,
    );
    newCartList.add(cartModIe);
    cartList=newCartList;
  }
  get throwCartList{
    return cartList;
  }
}
