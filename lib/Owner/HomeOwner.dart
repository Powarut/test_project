import 'package:flutter/material.dart';
import 'package:test_project/welcome_pange.dart';
import 'package:test_project/Order/order_delivery.dart';
import 'package:test_project/Order/order_finish.dart';
import 'package:test_project/Order/order_in.dart';
import 'package:test_project/Owner/manage_menu.dart';

class HomeOwner extends StatefulWidget {
  @override
  _HomeOwnerState createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner>
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
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          'ชื่อร้านอาหาร',
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
                Text('ORDER Delivery'),
                Text('ORDER Finish'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:[
                orderIN(),
                orderdelivery(),
                orderfinish(),
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
                color: Colors.blue,
              ),
              child: Text(
                'ชื่อเจ้าของร้าน',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              title: const Text('จัดการเมนูอาหาร'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return manage_menu();
                }));
              },
            ),

            ListTile(
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
