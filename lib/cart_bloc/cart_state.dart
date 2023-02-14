part of 'cart_bloc.dart';

///aw file a peman dale ka state y cart aka chya datay tedaya yan na, yanish error y haya!?
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded({this.cart = const Cart()});
  final Cart cart;

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
