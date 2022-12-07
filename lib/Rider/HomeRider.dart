import 'package:flutter/material.dart';
import 'package:test_project/welcome_pange.dart';
import 'package:test_project/Order/order_delivery.dart';
import 'package:test_project/Order/order_finish.dart';
import 'package:test_project/Rider/Delivery.dart';
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
                orderfinish()
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text(
                'ชื่อพนักงานส่ง',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.qr_code_scanner_outlined),
              title: const Text('Scan QR Code'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScanQRCode();
                }));
              },
            ),
            ListTile(
              trailing: Icon(Icons.logout_outlined),
              title: const Text('ลงชื่อออก'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Homescreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
