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
import 'package:online_shoping_3rd_try/modules/LayoutScreens/ProductsScreen.dart';

import '../../componants/variables.dart';
import '../../modules/LayoutScreens/SettingsScreen.dart';



class ShopCubit extends Cubit<ShopState>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  int productcount=0;

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
      // value!.data;
      // productModelJson=ProductModelJson.fromJson(value.data);
      // printFullText(productModelJson!.name.toString());
      // printFullText(productModelJson!.id.toString());

      for(int i=0;i<value!.data.length;i++){
        productModelJson =ProductModelJson.fromJson(value.data[i]);
      ProductList.add(productModelJson!);

        //printFullText(productModelJson!.name.toString());
        //printFullText(productModelJson!.id.toString());

      }
      emit(ShopSuccessHomeDataScreen());}

      ).catchError((error){

      print(error.toString());

      emit(ShopErrorHomeDataScreen());});

  }


  void getCategoryData(CategoryId)
  {
    emit(ShopLoadingCategoryDataScreen());

    DioHelperr.getData(
      url: CategoryProducts,
      query: {
        "Id" : CategoryId
      }
    ).then((value) {

      for(int i=0;i<value!.data.length;i++){
        productModelJson =ProductModelJson.fromJson(value.data[i]);
        ProductCategoryList.add(productModelJson!);

        //printFullText(productModelJson!.name.toString());
        //printFullText(productModelJson!.id.toString());

      }
      emit(ShopSuccessCategoryDataScreen());}

    ).catchError((error){

      print(error.toString());

      emit(ShopErrorCategoryDataScreen());});

  }


}