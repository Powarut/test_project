import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/selectUser.dart';
import 'package:test_project/Order/order_delivery.dart';
import 'package:test_project/Order/order_finish.dart';
import 'package:test_project/Rider/delivery/Delivery.dart';
import 'package:test_project/Rider/ScanQRCode.dart';

class HomeRider extends StatefulWidget {
  @override
  _HomeRiderState createState() => _HomeRiderState();
}

class _HomeRiderState extends State<HomeRider>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  late TabController _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.green,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              tabs: <Widget>[
                Text('ORDER IN'),
                Text('ORDER Finish'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                delivery(),
                orderfinish(),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcF9gjzHsADmFvKCSTTAr96wu20WP7rmu_AmmFycnQiqKXCW_rUgGnxyuHsWYfxnhhUK0&usqp=CAU")),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                accountName: Text(
                  "สมชาย คำสิงห์",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(profile.email!),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                trailing:
                    Icon(Icons.qr_code_scanner_outlined, color: textColor),
                title:
                    const Text('Scan QR Code', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScanQRCode();
                  }));
                },
              ),
              Divider(
                thickness: 2,
                color: Colors.black87,
              ),
              ListTile(
                trailing: Icon(Icons.logout, color: textColor),
                title: Text('ลงชื่อออก', style: TextStyle(fontSize: 16)),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return selectUser();
                    }));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
