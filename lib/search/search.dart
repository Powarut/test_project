import 'package:flutter/material.dart';
import 'package:test_project/Model/product_modle.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";


  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text("ค้นหา"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Item"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "โปรดใส่ชื่ออาหารที่คุณต้องการหาในเมนู",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: '',
                productQuantity: 1,
                onDelete: (){},
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
