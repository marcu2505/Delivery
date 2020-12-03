import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username) async {
    // ignore: deprecated_member_use
    return await Firestore.instance.collection("users")
        .where("name", isEqualTo: username)
        // ignore: deprecated_member_use
        .getDocuments();
  }
  uploadUserInfo(userMap){
    // ignore: deprecated_member_use
    Firestore.instance.collection("users")
    .add(userMap).catchError((e){
      print(e.toString());
      print("Aqui");
    });
  }
}
