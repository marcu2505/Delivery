import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login/entity/category.dart';

Stream<List<Category>> getAllCategorys() async* {
  yield* FirebaseFirestore.instance
      .collection('categorias')
      .snapshots()
      .asyncMap((snapshot) async {
    final list = snapshot.docs.map((category) async {
      // TODO: botar as imagens de categoria no Storage
      // var restauranteImages = FirebaseStorage.instance
      //     .ref()
      //     .child('restaurantes/')
      //     .child('${restaurant.id}/');
      return Category(
        id: category.id,
        name: category.data()["nome"],
        imageURL: category.data()["imagem"],
        // imageURL: await restauranteImages.child('image.jpg').getDownloadURL(),
      );
    }).toList();
    return await Future.wait(list);
  });
}
