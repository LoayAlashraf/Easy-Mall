import 'package:dio/dio.dart';
import 'package:online_shoping_3rd_try/models/AddProductToCartModel.dart';
import 'package:online_shoping_3rd_try/models/AddressModel.dart';

import '../../componants/variables.dart';
import '../../models/FavModel.dart';
import '../end_point.dart';

class DioHelperr
{
  static Dio? dio;
  static init()
  {
    dio=Dio(
      BaseOptions(
          baseUrl: 'https://gp2022.ekosysco.com',
          receiveDataWhenStatusError: true,
          headers:
          {
            'accept':'*/*',
          }
      ),
    );
  }

  static Future<Response?>getData({
    required String url,
     Map<String, dynamic> ?query,

  })async
  {
    return await dio?.get(
      url ,
      queryParameters: query,
    );
  }


  static Future<Response?>postData({
    required String url,
    Map<String, dynamic> ?query,
    Map<String, dynamic> ?data,
  })async
  {
    return await dio?.post(
        url ,
        queryParameters: query,
        data: data
    );
  }


  static Future <Response?> addToFav(userId,productId,productName,productImage,productDiscount,productCost,producCount,is_Cart,is_Active) async
  {
    return await DioHelperr.postData(
        url: addtofavoret,
        data:
        {
          "userId": userId,
          "productId": productId,
          "productName": productName,
          "productImage": productImage,
          "productDiscount": productDiscount,
          "productCost": productCost,
          "producCount": producCount,
          "is_Cart": is_Cart,
          "is_Active": is_Active,
        }).then(
            (value) {
              favModel = FavModel.fromJson(value!.data);
            }).catchError((error) {print(error.toString());});
  }
  static Future <Response?> addToCart(userId,productId,productName,productImage,productDiscount,productCost,producCount) async
  {
    return await DioHelperr.postData(
        url: AddProductToCart,
        data:
        {
          "userId": userId,
          "productId": productId,
          "productName": productName,
          "productImage": productImage,
          "productDiscount": productDiscount,
          "productCost": productCost,
          "producCount": producCount,
        }).then(
            (value) {
          addProductToCartModel = AddProductToCartModel.fromJson(value!.data);
          print('ProdcatHasBeenAddToCartSuccesfully');
        }).catchError((error) {print(error.toString());});
  }

  static Future<Response?>GetAddress()async
  {
    return DioHelperr.getData(
        url: FindAddresseUserId,
    query:
    {
      "UserId":2
    }
    ).then((value)
    {
      AddressModelByUserIdList.clear();
      for(int i=0;i<value!.data.length;i++){
        addressModel =AddressModel.fromJson(value.data[i]);
        AddressModelByUserIdList.add(addressModel!);}
      print('get adreess done for user id ');
    }).catchError((error){print(error.toString());});
  }


}