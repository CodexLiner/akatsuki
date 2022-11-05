// ignore_for_file: file_names, avoid_print

import 'dart:developer';

import 'package:get/get.dart';

import 'api_urls.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  final String appBaseUrl;


  ApiClient({required this.appBaseUrl});

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(appBaseUrl+uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }


  Future<Response> getUserInfo(String uri) async{
    try{
      Response response = await post(appBaseUrl+AppConstant.userLogin, {"uid": uri});
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri,Map<String, dynamic> body)async{
    try{
      log(body.toString());
      Response response = await post(appBaseUrl + uri, body);
      return response;
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  putData(String uri, Map<String, dynamic> body) async {
    try{
      Response response = await put(appBaseUrl+uri, body);
      return response;
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}