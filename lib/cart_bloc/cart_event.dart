part of 'cart_bloc.dart';

/// aw file a lo bakar henani event lo cart ya u (props) bakardet
/// lo barawrdkrdni datayakan agar datayakan rast bn yan na
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
