import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  final _apikey = 'AIzaSyBujjzJ9QgDoUgZ2pcuIXqqhaDK3X8NEpo';

  Future<void> _authenticate(String email, String password, String action) async {
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$_apikey');
    final response = await http.post(url, body: json.encode({
      'email': email,
      'password': password,
      'returnSecureToken': true,
    }) );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');

  }
  
  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}