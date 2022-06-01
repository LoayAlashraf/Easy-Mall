import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dio_helper.dart';
import 'package:online_shoping_3rd_try/Network/end_point.dart';
import 'package:online_shoping_3rd_try/modules/Login_screen/cubit/states.dart';

import '../../../models/ShopLoginModel.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=> BlocProvider.of(context);
  ShopLoginModel? LoginModel;

  void userLogin({
    required String email,
    required String password,
})
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email':email,
          'password':password,
        }
        ).then((value)
    {
      print(value?.data);
      LoginModel=ShopLoginModel.fromJson(value?.data);
      print(LoginModel?.status);
      print(LoginModel?.message);
      print(LoginModel?.data?.token);
      emit(ShopLoginSuccessState(LoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changePassowrdVisibility()
  {
    isPassword = !isPassword;
    suffix= isPassword ? Icons.visibility: Icons.visibility_off_outlined;
    emit(ShopChangePassowrdVisibility());

  }
}