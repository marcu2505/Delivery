import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String id;
  String name;
  String mainCategory;
  String imageURL;
  String coverURL;
  String address; // TODO: retirar esse campo
  GeoPoint location; // TODO: precisa da API de GeoLocation do Google
  double deliveryFee;
  double minOrderPrice;
  int minDeliveryTime;
  int maxDeliveryTime;
  // TODO: categorias

  Restaurant({
    this.id,
    this.name,
    this.mainCategory,
    this.imageURL,
    this.coverURL,
    this.address,
    this.location,
    this.deliveryFee,
    this.minOrderPrice,
    this.minDeliveryTime,
    this.maxDeliveryTime,
  }) {
    this.id = id;
    this.name = name;
    this.mainCategory = mainCategory;
    this.imageURL = imageURL;
    this.coverURL = coverURL;
    this.address = address;
    this.location = location;
    this.deliveryFee = deliveryFee;
    this.minOrderPrice = minOrderPrice;
    this.minDeliveryTime = minDeliveryTime;
    this.maxDeliveryTime = maxDeliveryTime;
  }

  toString() {
    return "Restaurant: {id: ${this.id} "
        "name: ${this.name} "
        "coverURL: ${this.coverURL} "
        "imageURL: ${this.imageURL} "
        "address: ${this.address} "
        "location: ${this.location} "
        "deliveryTax: ${this.deliveryFee} "
        "minOrderPrice: ${this.minOrderPrice} "
        "minDeliveryTime: ${this.minDeliveryTime} "
        "maxDeliveryTime: ${this.maxDeliveryTime}}";
  }
}
