import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/model.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

var client = http.Client();

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async{
      emit(CocktailLoading());
      fetchProducts();
   

 
    });
  }
}

 Future<List<Products>?> fetchProducts() async {
 
    var response = await client.get(
        Uri.parse('https://purer.cslox-th.ruk-com.la/api/product'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      print('Products::::::====>Ok' + '${response.statusCode}' + response.body);
      var jsonString = response.body;
      // ProductFinishState(jsonDecode(response.body));
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
