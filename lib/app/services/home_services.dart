import 'dart:convert';
import 'package:news_app/constants.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future getNewsLists() async {
    final res = await http.get(
      Uri.parse('${CONST.BASE_URL}/getResults?page=1'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future getMoreNews({required String url}) async {
    final res = await http.get(
      Uri.parse(url),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }
}
