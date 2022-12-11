import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
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
    final profile = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ownerColor,
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
        backgroundColor: ownerColor,
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
                trailing: Icon(Icons.food_bank_outlined,color: textColor),
                title: const Text('จัดการเมนูอาหาร',
                    style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return manage_menu();
                  }));
                },
              ),
              Divider(
                thickness: 2,
                color: Colors.black87,
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
      ),
    );
  }
}
