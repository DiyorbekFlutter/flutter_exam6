import 'dart:convert';
import 'dart:io';

final class ClientService {
  static const String _baseUrl = "api.api-ninjas.com";
  static const String _api = "/v1/nutrition";

  static const String _baseUrlMockApi = "https://65e04610d3db23f76248cbbc.mockapi.io";
  static const String _apiMockApi = "/products";

  static Future<String?> get(Map<String, String> param) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.https(_baseUrl, _api, param);

    try{
      HttpClientRequest request = await httpClient.getUrl(url);
      request.headers.set('x-api-key', 'NGypZpR79HdLSsPfQsAR1g==nMxRqGFHs5YwfmMy');
      HttpClientResponse response = await request.close();
      httpClient.close();

      if(response.statusCode == HttpStatus.ok) return await response.transform(utf8.decoder).join();
    } catch(e) {
      httpClient.close();
    }

    return null;
  }

  static Future<String?> getFavorites() async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("$_baseUrlMockApi/$_apiMockApi");

    try{
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();
      httpClient.close();

      if(response.statusCode == HttpStatus.ok) return await response.transform(utf8.decoder).join();
    } catch(e) {
      httpClient.close();
    }

    return null;
  }

  static Future<bool> post(Map<String, dynamic> data) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("$_baseUrlMockApi/$_apiMockApi");

    try{
      HttpClientRequest request = await httpClient.postUrl(url);
      request.headers.set("Content-Type", "application/json");
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      httpClient.close();
      response.transform(utf8.decoder).join();

      if([HttpStatus.ok, HttpStatus.created].contains(response.statusCode)) return true;
    } catch(e){
      httpClient.close();
    }

    return false;
  }

  static Future<bool> delete(String id) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("$_baseUrlMockApi/$_apiMockApi/$id");

    try{
      HttpClientRequest request = await httpClient.deleteUrl(url);
      HttpClientResponse response = await request.close();
      httpClient.close();
      response.transform(utf8.decoder).join();

      if([200, 201].contains(response.statusCode)) return true;
    } catch(e) {
      httpClient.close();
    }

    return false;
  }
}