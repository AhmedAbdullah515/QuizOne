import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weatherapplication/Models/authmodel.dart';
import 'package:weatherapplication/Services/authservice.dart';

class Authprovider extends ChangeNotifier
 {
   Authmodel? auth;
   Future<bool> userlogin({
    required String email,
    required String password
   })
   async{
    final response=await AuthService.login(email, password);
    auth=response;
    return response.Status;
   }
   Future<bool>userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
   })
   async{
     final response= await AuthService.register(name, email, password, phone);
     auth=response;
     return response.Status;
   }
 }