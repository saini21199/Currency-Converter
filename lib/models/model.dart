import 'dart:convert';
import 'package:http/http.dart' as http;

class Currency {
  List<String> code;
  List<dynamic> value;

  Currency({this.code, this.value});
}

Future fetchcurrency() async {
  http.Response res = await http.get('http://www.apilayer.net/api/live?access_key=a1a74105bbee860d6adb102d83a25ac0&format=1');
  if (res.statusCode == 200) {
    Map<String,dynamic> datamap = json.decode(res.body)['quotes'];
    Currency currency = Currency(code: datamap.keys.toList(), value: datamap.values.toList());
    return currency;
  }
  return null;
}