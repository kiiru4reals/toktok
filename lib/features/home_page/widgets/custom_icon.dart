import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 38,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 100),
                borderRadius: BorderRadius.circular(7)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 38,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 38,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7)),
              child: Icon(Icons.add, color: Colors.black,),
            ),
          )
        ],
      ),
    );
  }
}
