import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:onlineshop/model/items.dart';
import 'package:onlineshop/model/order.dart';
import 'package:onlineshop/shopping_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

///aw Bloc a lo order u krdni item akan lanaw Cart y yan sabatay ka yakamjar loading a
///dwaye dabita Loaded yani datayakan hatyna naw Cart y
///dwatr Add u Remove y tedaya

class CartBloc extends Bloc<CartEvent, CartState> {
  final ShoppingRepository shoppingRepository;
  CartBloc(this.shoppingRepository) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemsAdded>(_onItemAdded);
    on<CartItemsRemoved>(_onItemRemoved);
  }

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await shoppingRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(items: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onItemAdded(
    CartItemsAdded event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(event.item);
        emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemsRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeItemFromCart(event.item);
        emit(
          CartLoaded(
            cart: Cart(
              items: [...state.cart.items]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
