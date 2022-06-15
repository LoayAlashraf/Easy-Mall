import 'package:flutter/material.dart';
import 'package:online_shoping_3rd_try/modules/CategoryProductsScreen.dart';

import '../../componants/components.dart';
import '../../componants/variables.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                sections(
                    onTap: ()
                    {
                      navigateTo(context, CategoryProductsScreen(CategoryId = 1));
                      },
                    assetImage: AssetImage('images/HomeScreen/mens.jpg',),
                    firstText: 'Men\'s',
                    SecondText: 'Fashion'),
                sections(
                  onTap: ()
                  {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => WomenFashion(),),
                    // );
                  },
                  assetImage: AssetImage('images/HomeScreen/women.jpeg',),
                  firstText: 'Women\'s',
                  SecondText: 'Fashion',),
                sections(
                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SuperMarket(),),
                    // );
                  },
                  assetImage: AssetImage('images/HomeScreen/super market.jpg',),
                  firstText: 'Super',
                  SecondText: 'Market',),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BabyAndToys(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/baby.jpg',),
                    firstText: 'BaBy',
                    SecondText: '& Toy\'s')

              ],

            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MobileAndTablits(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/mobile.jpg',),
                    firstText: 'Mobile',
                    SecondText: '& Tablet'),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Gaming()
                      //     ,),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/gaming.jpg',),
                    firstText: 'Gaming',
                    SecondText: ''),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Camera(),),
                     // );
                    },
                    assetImage: AssetImage('images/HomeScreen/camera.jpg',),
                    firstText: 'Camera',
                    SecondText: ''),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Audio(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/Audio.png',),
                    firstText: 'Audio',
                    SecondText: ''),


              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TvAndAccessoris(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/tv.jpg',),
                    firstText: 'TV &',
                    SecondText: 'Accessoris'),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LaptopsAndAccessoris(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/laptop.jpg',),
                    firstText: 'Laptop &',
                    SecondText: 'Accessoris'),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeAppliances(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/home.jpg',),
                    firstText: 'Home',
                    SecondText: 'Appliances'),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>HealthAndBeauty() ,),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/health.jpg',),
                    firstText: 'Health',
                    SecondText: '& Beauty'),

              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => StationeryAndBooks() ,),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/stationery.jpg',),
                    firstText: 'Stationery',
                    SecondText: '& Book'),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AutoMotive(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/automotive.jpg',),
                    firstText: 'AutoMotive',
                    SecondText: ''),
                sections(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Sports(),),
                      // );
                    },
                    assetImage: AssetImage('images/HomeScreen/sports.jpg',),
                    firstText: 'Sport',
                    SecondText: ''),
                Expanded(
                  child: SizedBox(
                    width: 80.0,
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
