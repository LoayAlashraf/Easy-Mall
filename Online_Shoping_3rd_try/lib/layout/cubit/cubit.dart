import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dioo_helper.dart';
import 'package:online_shoping_3rd_try/Network/end_point.dart';
import 'package:online_shoping_3rd_try/componants/constans.dart';
import 'package:online_shoping_3rd_try/layout/cubit/states.dart';
import 'package:online_shoping_3rd_try/models/ProductModel.dart';
import 'package:online_shoping_3rd_try/modules/LayoutScreens/CategoriesScreen.dart';
import 'package:online_shoping_3rd_try/modules/LayoutScreens/FavScreen.dart';
import 'package:online_shoping_3rd_try/modules/LayoutScreens/MyCart.dart';
import 'package:online_shoping_3rd_try/modules/LayoutScreens/ProductsScreen.dart';

import '../../modules/LayoutScreens/SettingsScreen.dart';



class ShopCubit extends Cubit<ShopState>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<Widget> bottomScreen =[
    ProductsScreen(),
    CategoriesScreen(),
    FavScreen(),
    // MyCartScreen(),
    SettingsScreen(),
  ];

  void changBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  ProductModelJson? productModelJson;



  void getHomeData()
  {
    emit(ShopLoadingHomeDataScreen());

    DioHelperr.getData(
        url: Product,
    ).then((value) {


      productModelJson=ProductModelJson.fromJson(value!.data[0]);

      printFullText(productModelJson!.name.toString());

      emit(ShopSuccessHomeDataScreen());}

      ).catchError((error){

      print(error.toString());

      emit(ShopErrorHomeDataScreen());});

  }


}