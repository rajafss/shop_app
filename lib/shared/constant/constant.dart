

import 'package:shopapp/network/local/cache_helper.dart';

void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });

}
String token = CacheHelper.getToken(key: 'token')?? '';

String uId = CacheHelper.getUID(uId: 'uId')?? '';