import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comment {
  String userName;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment(
      {required this.datePublished,
      required this.userName,
      required this.comment,
      required this.likes,
      required this.profilePhoto,
      required this.uid,
      required this.id});

  Map<String, dynamic> toJson() => {
    'username': userName,
    'comment': comment,
    'datePublished': datePublished,
    'likes': likes,
    'profilePhoto': profilePhoto,
    'uid': uid,
    'id': id
  };

  static Comment fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(datePublished: snapshot['datePublished'], userName: snapshot['userName'], comment: snapshot['comment'], likes: snapshot['likes'], profilePhoto: snapshot['profilePhoto'], uid: snapshot['uid'], id: snapshot['id']);


  }


}
