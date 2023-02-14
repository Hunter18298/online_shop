import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:onlineshop/model/items.dart';

//lera lo xazn krdni datay naw Cart u peshandani
class Cart extends Equatable {
  const Cart({this.items = const <Items>[]});

  final List<Items> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  @override
  List<Object> get props => [items];
}
