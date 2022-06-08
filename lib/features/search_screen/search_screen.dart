import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toktok/features/auth/models/user_model.dart';
import 'package:toktok/features/profile/my_profile_screen.dart';
import 'package:toktok/features/search_screen/controllers/search_screen_controller.dart';
import 'package:toktok/features/search_screen/screens/user_profile_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchScreenController searchController =
      Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: const InputDecoration(
                  filled: false,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
              onFieldSubmitted: (value) => searchController.searchUser(value),
            ),
          ),
          body: searchController.searchedUsers.isEmpty
              ? Center(
                  child: Text(
                    "Discover users",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              uid: user.uid,
                            ))),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePhoto),
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                }));
    });
  }
}
