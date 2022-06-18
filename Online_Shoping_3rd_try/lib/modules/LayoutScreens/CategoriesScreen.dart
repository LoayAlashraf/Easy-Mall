import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/modules/CategoryProductsScreen.dart';

import '../../componants/components.dart';
import '../../componants/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilderRec(
            condition: CategoryList != null,
            builder:(context)=> CategoryWidget(CategoryList,context),
        fallback:(context) => Center(child: CircularProgressIndicator())
        );
      } );
  }

  Widget CategoryWidget (CategoryList,context) => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1/1.5,
          children:
          List.generate( CategoryList!.length ,

                (index) => InkWell (
              onTap: ()
              {
                navigateTo(context, CategoryProductsScreen(CategoryId = CategoryList[index]!.id));
              },
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(CategoryList[index]!.image.toString()),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                      height:8.0),
                  Text(
                    CategoryList[index]!.name.toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0 ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
