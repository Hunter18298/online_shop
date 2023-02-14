import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Items {
  final String name;
  final String image;
  final String description;
  final int price;
  final bool? isFavourite;

  const Items({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isFavourite = false,
  });
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      isFavourite: json['isFavourite'],
    );
  }
  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'isFavourite': isFavourite
      };

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'isFavourite': isFavourite
    };
  }

  @override
  List<Object> get props => [name, image, description, price];
}
