import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_coding/data/exception/appException.dart';
import 'package:bloc_clean_coding/data/network/baseApiService.dart';
import 'package:http/http.dart' as https;

class NetworkServicesApi implements Baseapiservice{
  @override
  Future<dynamic> getApi(String url) async{
    dynamic jsonResponse;
    try{
     final response =await https.get(Uri.parse(url)).timeout(const Duration(seconds: 55));
     jsonResponse = returnResponse(response);
     if(response.statusCode == 200){
       

     }
    }on SocketException{
        InternetException("");
    }on TimeoutException{
        RequestTimeOutException("Time out try again later");
    }
     return jsonResponse;
  }

  @override
  Future<dynamic> postApi(data, String url) async{
 dynamic jsonResponse;
    try{
     final response =await https.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 55));
     jsonResponse = returnResponse(response);
     if(response.statusCode == 200){
       

     }
    }on SocketException{
        InternetException("");
    }on TimeoutException{
        RequestTimeOutException("Time out try again later");
    }
     return jsonResponse;
  }

  @override
  Future <dynamic>putApi(data, String url) async{
     dynamic jsonResponse;
    try{
     final response =await https.put(Uri.parse(url), body: data).timeout(const Duration(seconds: 55));
     jsonResponse = returnResponse(response);
     if(response.statusCode == 200){
       

     }
    }on SocketException{
        InternetException("");
    }on TimeoutException{
        RequestTimeOutException("Time out try again later");
    }
     return jsonResponse;
  }

  @override
  Future <dynamic> deleteApi(String url) async{
     dynamic jsonResponse;
    try{
     final response =await https.delete(Uri.parse(url)).timeout(const Duration(seconds: 55));
     jsonResponse = returnResponse(response);
     if(response.statusCode == 200){
       

     }
    }on SocketException{
        InternetException("");
    }on TimeoutException{
        RequestTimeOutException("Time out try again later");
    }
     return jsonResponse;
  }

   dynamic returnResponse(https.Response response){
  switch (response){
    case 200:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
   
    case 400:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
   
   case 401:
      throw UnauthorisedException();
    
    case 500:
      throw FetchDataException("Communnication Failed. Server Error ${response.statusCode.toString()}");

     default: UnauthorisedException();
   
  }
 }

}