import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/send/send_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  String baseUrl = "http://lafyuu.qtlms.uz/api/v1/";

  Future<HttpResult> _getRequest(String url) async {
    // print(url);
    http.Response response = await http.get(
      Uri.parse(url),
      headers: await _header(),
    );
    // print(response.body);
    return _result(response);
  }

  Future<HttpResult> _postRequest(String url, body) async {
    // print(url);
    // print(body);
    // print(await _header());
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: await _header(),
    );
    // print(response.body);
    return _result(response);
  }

  Future<HttpResult> _putRequest(String url, body) async {
    // print(url);
    // print(body);
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: await _header(),
    );
    // print(response.body);
    return _result(response);
  }

  HttpResult _result(http.Response response) {
    return HttpResult(
      statusCode: response.statusCode,
      isSuccess: response.statusCode >= 200 && response.statusCode < 300,
      result: json.decode(utf8.decode(response.bodyBytes)),
    );
  }

  Future<Map<String, String>> _header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      return {};
    } else {
      return {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8',
      };
    }
  }

  Future<HttpResult> getCategoryProducts(int id) async {
    return _getRequest('${baseUrl}product/?category=$id');
  }

  Future<HttpResult> getReviews(int id) async {
    return _getRequest('${baseUrl}reviews?propducts=$id');
  }

  Future<HttpResult> getOrders() async {
    return _getRequest("${baseUrl}Orders");
  }

  Future<HttpResult> getSuperFlash() {
    return _getRequest("${baseUrl}superflash");
  }

  Future<HttpResult> getCategory() async {
    return _getRequest("${baseUrl}category");
  }

  Future<HttpResult> getFlashSale() async {
    return _getRequest('${baseUrl}product?flash_sale=true');
  }

  Future<HttpResult> getMegaSale() async {
    return _getRequest('${baseUrl}product?mega_sale=true');
  }

  Future<HttpResult> getHomeSale() async {
    return _getRequest('${baseUrl}product?home_sale=true');
  }

  Future<HttpResult> getSuperFlashById(int id) async {
    return _getRequest('${baseUrl}superflash/$id');
  }

  Future<HttpResult> getProductDetail(int id) async {
    return _getRequest('${baseUrl}product/$id');
  }

  Future<HttpResult> login(String login, String password) async {
    var data = {
      "email": login,
      "password": password,
    };
    return _postRequest('${baseUrl}login', data);
  }

  Future<HttpResult> register(
    String email,
    String firstname,
    String password,
    String confirmPassword,
  ) async {
    var data = {
      'email': email,
      'firstname': firstname,
      'password': password,
      'confirm_password': confirmPassword,
    };
    return _postRequest('${baseUrl}register', data);
  }

  /// post json list
  Future<HttpResult> postOrder(SendOrderModel saveOrderModel) async {
    return _postRequest('${baseUrl}order', json.encode(saveOrderModel));
  }

  ///post review
  Future<HttpResult> postReview(
    int productId,
    int starCount,
    String text,
  ) async {
    var data = {
      "start": starCount,
      "text": text,
      "propducts": productId,
    };
    return _postRequest('${baseUrl}add_reviews', jsonEncode(data));
  }

  Future<HttpResult> accept(String email, String smsCode) async {
    var data = {
      "email": email,
      "sms_code": smsCode,
    };
    return _postRequest('${baseUrl}accept', data);
  }

  Future<HttpResult> getProfile() async {
    return _getRequest('${baseUrl}me');
  }

  Future<HttpResult> setGender(String gender) async {
    var data = {
      'gender': gender,
    };
    return _putRequest('${baseUrl}profil', jsonEncode(data));
  }

  Future<HttpResult> setBirthday(String bday) async {
    var data = {
      'birth_date': bday,
    };
    return _putRequest('${baseUrl}profil', jsonEncode(data));
  }

  Future<HttpResult> setPhoneNumber(String number) async {
    var data = {'Number': number};
    return _putRequest('${baseUrl}profil', jsonEncode(data));
  }

  Future<HttpResult> setName(String fn, String ln) async {
    var data = {
      'first_name': fn,
      'last_name': ln,
    };
    return _putRequest('${baseUrl}profil', jsonEncode(data));
  }
}
