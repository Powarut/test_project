import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/ProductModle/DrawerSide.dart';
import 'package:test_project/ProductModle/ProductOverview.dart';
import 'package:test_project/ProductModle/singal_product.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/product_provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late ProductProvider productProvider;

  Widget _buildFood1(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('อาหารตามสั่ง'),
              GestureDetector(
                onTap: (){
                },
                child: Text(
                  'ดูทั้งหมด',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getOneProductDataList.map(
                  (OneProductData) {
                return SingalProduct(
                  productImage: OneProductData.productImage,
                  productName: OneProductData.productName,
                  productPrice: OneProductData.productPrice,
                  productId: OneProductData.productId,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: OneProductData.productName,
                          productImage: OneProductData.productImage,
                          productPrice: OneProductData.productPrice,
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFood2(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('ของทานเล่น'),
              Text(
                'ดูทั้งหมด',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingalProduct(
                productImage:
                ('https://firebasestorage.googleapis.com/v0/b/project-3e0ab.appspot.com/o/%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2.jpg?alt=media&token=dfaf4fc3-4032-41df-a858-a894f63d97ac'),
                productName: 'กะเพรา',
                productPrice: 50,
                productId: '',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productName: 'กะเพรา',
                        productImage:
                        'https://firebasestorage.googleapis.com/v0/b/project-3e0ab.appspot.com/o/%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2.jpg?alt=media&token=dfaf4fc3-4032-41df-a858-a894f63d97ac',
                        productPrice: 30,
                      ),
                    ),
                  );
                },
              ),
              SingalProduct(
                  productImage:
                  ('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg'),
                  productName: 'Herbs',
                  productPrice: 30,
                  productId: 'sdasd',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: 'Herbs',
                          productImage:
                          'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                          productPrice: 30,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFood3(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('เครื่องดื่ม'),
              Text(
                'ดูทั้งหมด',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getDrinkProductDataList.map(
                  (DrinkProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: DrinkProductData.productName,
                          productImage: DrinkProductData.productImage,
                          productPrice: DrinkProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productImage: DrinkProductData.productImage,
                  productName: DrinkProductData.productName,
                  productPrice: DrinkProductData.productPrice,
                  productId: DrinkProductData.productId,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initstate() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchOneProductData();
    productProvider.fatchTwoProductData();
    productProvider.fatchDrinkProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: memberColor,
              radius: 12,
              child: Icon(
                Icons.shop,
                size: 17,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBgey6JLszE2OdPRkkUEZ-px90gv3gKfOgHA&usqp=CAU')),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
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
                                'โปรโมชั่น',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.green,
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
            _buildFood1(context),
            _buildFood2(context),
            _buildFood3(context),
          ],
        ),
      ),
    );
  }
}
