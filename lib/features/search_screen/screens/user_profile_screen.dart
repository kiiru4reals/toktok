import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String uid;
  const UserProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),

    );
  }
}
