import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ProductModle/DrawerSide.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/welcome_pange.dart';
import 'package:test_project/Member/Edit%20Member.dart';
import 'package:test_project/Member/QR%20Code.dart';


class HomeMember extends StatefulWidget {

  @override
  State<HomeMember> createState() => _HomeMemberState();
}

class _HomeMemberState extends State<HomeMember> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerSide(),
        appBar: AppBar(
          backgroundColor: memberColor,
          elevation: 0,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
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
                return Container(
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
                          onPressed: () {

                          },
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
      ),
    );
  }
}
