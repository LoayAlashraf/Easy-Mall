import 'package:flutter/material.dart';

import '../Network/local/cache_helper.dart';
import '../modules/Login_screen/login_screen.dart';
import 'components.dart';

void Signout (context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';

const kBackgroundColor= Color(0xFF1EFF1);
const kPrimaryColor= Color(0xFF219ebc);
const kSecoundryColor= Color(0xFFfcca46);
const kTextColor= Color(0xFF023047);
const kTextLightColor= Color(0xFF747474);
const kBlue= Color(0xFF40BAD5);

const kDefaultpadding=20.0;

