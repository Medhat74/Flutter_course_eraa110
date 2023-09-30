
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'money_state.dart';

class MoneyCubit extends Cubit<MoneyState> {
  MoneyCubit() : super(MoneyInitial());

  static MoneyCubit get(context)=> BlocProvider.of(context);

  List products = [
    {"name": "Tesco", "price": 8.99},
    {"name": "Pet Shop", "price": 11.30},
    {"name": "Toms Vegetables", "price": 3.19},
    {"name": "Tesco", "price": 13.45},
    {"name": "Bakery", "price": 8.99},
    {"name": "Cakes&Donuts", "price": 11.40},
    {"name": "Pharmacy", "price": 3.19},
  ];

  void addToProducts(String name, double price){
    products.add({"name" : name, "price": price});
    emit(AddToProductsState());
  }

}
