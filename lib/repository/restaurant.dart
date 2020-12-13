import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_login/entity/restaurant.dart';

// getRestaurant(String id) async {
//   Restaurant restaurant = Restaurant();
//   DocumentSnapshot restaurantDoc =
//       await FirebaseFirestore.instance.collection('restaurantes').doc(id).get();
//
//   restaurant.id = id;
//   restaurant.name = restaurantDoc.data()["nome"];
//   restaurant.name = restaurantDoc.data()["categoria_principal"];
//   restaurant.address = restaurantDoc.data()["endereco"];
//   restaurant.location = null; // TODO implementar
//   restaurant.deliveryTax = restaurantDoc.data()["taxa_entrega"] + .0;
//   restaurant.minOrderPrice = restaurantDoc.data()["minimo"] + .0;
//   restaurant.minDeliveryTime = restaurantDoc.data()["tempo"]["minimo"];
//   restaurant.maxDeliveryTime = restaurantDoc.data()["tempo"]["maximo"];
//
//   var storageRef = FirebaseStorage.instance
//       .ref()
//       .child('restaurantes/')
//       .child('${restaurant.id}/');
//
//   restaurant.imageURL = await storageRef.child('image.jpg').getDownloadURL();
//   restaurant.coverURL = await storageRef.child('cover.jpg').getDownloadURL();
//
//   return restaurant;
// }

Stream<List<Restaurant>> getAllRestaurants() async* {
  yield* FirebaseFirestore.instance
      .collection('restaurantes')
      .snapshots()
      .asyncMap((snapshot) async {
    final list = snapshot.docs.map((restaurant) async {
      var restauranteImages = FirebaseStorage.instance
          .ref()
          .child('restaurantes/')
          .child('${restaurant.id}/');

      return Restaurant(
        id: restaurant.id,
        name: restaurant.data()["nome"],
        mainCategory: restaurant.data()["categoria_principal"],
        imageURL: await restauranteImages.child('image.jpg').getDownloadURL(),
        coverURL: await restauranteImages.child('cover.jpg').getDownloadURL(),
        address: restaurant.data()["endereco"],
        location: null,
        deliveryFee: restaurant.data()["taxa_entrega"] + .0,
        minOrderPrice: restaurant.data()["minimo"] + .0,
        minDeliveryTime: restaurant.data()["tempo"]["minimo"],
        maxDeliveryTime: restaurant.data()["tempo"]["maximo"],
      );
    }).toList();
    return await Future.wait(list);
  });
}
