// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';

import 'api_urls.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;


  ApiClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    token=AppConstant.token;
    timeout=const Duration(seconds: 30);
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }


  Future<Response> getUserInfo(String uri) async{
    try{
      Response response = await post(AppConstant.userLogin, {"uid": uri});
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri,dynamic body)async{
    try{
      Response response = await post(uri, body,headers: _mainHeaders);
      return response;
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  putData(String uri, Map<String, dynamic> body) async {
    try{
      Response response = await put(uri, body);
      return response;
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}