import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/widgets/add_menu.dart';
import '../Model/ow_create.dart';

class manage_menu extends StatefulWidget {
  final Stream<QuerySnapshot> Food =
      FirebaseFirestore.instance.collection('Food').snapshots();
  @override
  State<manage_menu> createState() => _manage_menuState();
}

class _manage_menuState extends State<manage_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'จัดการเมนูอาหาร',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Food").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 60,
                    child:
                        FittedBox(child: Image.network(document['FoodImage'])),
                  ),
                  title: Text(document["FoodName"]),
                  subtitle: Text(document["FoodPrice"] + "\rบาท"),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          final docFood = FirebaseFirestore.instance
                              .collection('Food')
                              .doc();
                          docFood.update({});
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          final docFood = FirebaseFirestore.instance
                              .collection('Food')
                              .doc();
                          docFood.delete();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddMenu();
          }));
        },
        child: Icon(Icons.add_sharp),
      ),
    );
  }
}
