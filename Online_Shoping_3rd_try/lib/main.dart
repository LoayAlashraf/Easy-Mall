import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/layout/ShopLayout.dart';
import 'package:online_shoping_3rd_try/layout/cubit/cubit.dart';
import 'package:online_shoping_3rd_try/layout/cubit/states.dart';
import 'package:online_shoping_3rd_try/modules/Login_screen/cubit/cubit.dart';
import 'package:online_shoping_3rd_try/modules/Login_screen/cubit/states.dart';
import 'package:online_shoping_3rd_try/modules/Login_screen/login_screen.dart';
import 'Network/Remote/dio_helper.dart';
import 'Network/Remote/dioo_helper.dart';
import 'Network/bloc_observer.dart';
import 'Network/local/cache_helper.dart';
import 'modules/on_bording_screen/on_bording_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  DioHelperr.init();
  await CacheHelper.init();

  Widget widget;


  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if(onBoarding != null)
    {
      if(token != null) widget = ShopLayout();
      else widget = ShopLoginScreen();
    }
  else widget = OnBordingScreen();


  print(onBoarding);

  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // final bool onBoarding;
  final Widget startWidget;
  MyApp({
    // required this.onBoarding,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
            create: (BuildContext context)=>ShopCubit()..getHomeData(),
        )
      ],
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context,state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget
          );
          },
      ),
    );
  }
}

// return MultiBlocProvider(
//     providers:
//     [
//
//     ],
//     child: BlocConsumer<>(
//       listener: (context, state) {},
//       builder: (context,state) {