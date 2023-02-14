import 'dart:async';

import 'package:onlineshop/model/items.dart';

//zanini datakan lanaw shop aka
const _delay = Duration(milliseconds: 800);

const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class ShoppingRepository {
  final _items = <Items>[];

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Items>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Items item) => _items.add(item);

  void removeItemFromCart(Items item) => _items.remove(item);
}
