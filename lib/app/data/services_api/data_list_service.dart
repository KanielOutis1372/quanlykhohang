import 'dart:convert';
import 'package:http/http.dart' as http;

class DataListService {
  String? token;
  String? urlAPI;
  Future<Map<String, dynamic>> fetchData(token, urlAPI) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(urlAPI);
    final resp = await http.get(url, headers: headers);
    if (resp.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(resp.body);
      return data;
    }
    else {
      return {};
    }
  }
}
