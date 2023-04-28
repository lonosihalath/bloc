part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class CocktailLoading extends ProductState  {}

class CocktailError extends ProductState  {

  final String message;

  CocktailError(this.message);
}

class ProductFinishState extends ProductState {
  final List<Products> drinks;

   ProductFinishState(this.drinks);
}
