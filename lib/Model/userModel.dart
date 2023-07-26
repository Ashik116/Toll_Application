import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  bool isAdmin;
  bool isTeesta;
  bool isMohanonda;
  bool isCharsindur;
  bool isChittagong;
  bool isManikganj;
  bool isBhangga;

  List<UserModel> userList = [];
  
  UserModel({
    this.id, 
    this.email, 
    this.isAdmin,
    this.isTeesta,
    this.isMohanonda,
    this.isCharsindur,
    this.isChittagong,
    this.isManikganj,
    this.isBhangga,
  });
}
