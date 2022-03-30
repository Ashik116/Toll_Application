import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  bool isAdmin;
  bool isTeesta;
  bool isMohanonda;
  bool isChittagong;
  bool isManikganj;

  List<UserModel> userList = [];
  
  UserModel({
    this.id, 
    this.email, 
    this.isAdmin,
    this.isTeesta,
    this.isMohanonda,
    this.isChittagong,
    this.isManikganj
  });
}
