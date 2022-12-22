import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ProductModle/DrawerSide.dart';
import 'package:test_project/constants/color.dart';

class HomeMember extends StatefulWidget {
  @override
  State<HomeMember> createState() => _HomeMemberState();
}

class _HomeMemberState extends State<HomeMember> {
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: memberColor,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: StreamBuilder(
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
                return Row(
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
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count --;
                        });
                      },
                      icon: Icon(
                        Icons.remove_circle,
                      ),
                    ),
                    Text("${count}",style: TextStyle(color: textColor),),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count ++;
                        });
                      },
                      icon: Icon(
                        Icons.add_circle,
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: Text("รวมยอดสั่ง: 0\rบาท"),
          onPressed: (){},
          color: memberColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
