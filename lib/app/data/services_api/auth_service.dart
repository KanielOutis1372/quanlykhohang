import 'package:http/http.dart' as http;
import 'package:quanlykhohang/app/data/services_api/url_api.dart';

class AuthService {
  String? username;
  String? password;

  AuthService();

  Future<http.Response> login(String? username, String? password) async {
    final response = await http.post(
      Uri.parse(UrlAPI.loginAPI),
      body: {'username': username, 'password': password},
    );
    return response; 
  }
}

