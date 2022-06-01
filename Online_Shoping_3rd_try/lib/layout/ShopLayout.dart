import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/local/cache_helper.dart';
import 'package:online_shoping_3rd_try/componants/components.dart';
import 'package:online_shoping_3rd_try/layout/cubit/cubit.dart';
import 'package:online_shoping_3rd_try/modules/Login_screen/login_screen.dart';

import '../modules/searsh/SearchScreen.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context , state){},
      builder: (context , state)
      {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('EASY MALL'),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                    },
                  icon: Icon(Icons.search))
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index)
            {
              cubit.changBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps,),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,),
                  label: 'Favorite'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,),
                  label: 'Settings'
              ),

            ],
          ),
        );
      } ,
    );
  }
}
