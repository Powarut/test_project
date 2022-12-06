import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext Countext) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if(count > 1){
                      setState(() {
                        count--;
                      });
                    }
                    if(count == 1){
                      setState(() {
                        isTrue = false;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: memberColor,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      count++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: memberColor,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: memberColor),
                ),
              ),
            ),
    );
  }
}
