import 'package:flutter/material.dart';
import 'package:test_project/ProductModle/DrawerSide.dart';
import 'package:test_project/constants/color.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: memberColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "หน้าเมนู",
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.shopping_cart,
              color: textColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBgey6JLszE2OdPRkkUEZ-px90gv3gKfOgHA&usqp=CAU'),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 130, bottom: 10),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xffd1ad17),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'OPEN',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.yellow,
                                        blurRadius: 10,
                                        offset: Offset(3, 3))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Resturant',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'ยินดีต้อนรับ!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("อาหารตามสั่ง"),
                  Text(
                    "ดูทั้งหมด",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 230,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/project-3e0ab.appspot.com/o/%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2.jpg?alt=media&token=dfaf4fc3-4032-41df-a858-a894f63d97ac')),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'กะเพรา',
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '50\rบาท',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
