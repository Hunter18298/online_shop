part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemsAdded extends CartEvent {
  final Items item;

  const CartItemsAdded(this.item);
  @override
  List<Object> get props => [item];
}

class CartItemsRemoved extends CartEvent {
  final Items item;

  const CartItemsRemoved(this.item);
  @override
  List<Object> get props => [item];
}
