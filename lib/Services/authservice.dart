import 'package:dio/dio.dart';
import 'package:weatherapplication/Models/authmodel.dart';

class AuthService
 {
  Dio dio = Dio();
  static Future<Authmodel> login( String email, String password) async {
    try 
    {
      Response response = await Dio().post(
        ' https://elsewedyteam.runasp.net/api/Login/CheckUser',
        data: {'Email': email, 'Password': password},
      );
      return Authmodel.fromJson(response.data);
    } on DioException catch (e) 
    {
      throw Exception(e.message);
    } catch(othererror){
      throw Exception(othererror.toString());
    }
    
  }
  
   static Future<Authmodel> register(String name, String email, String password,String Phone) async {
    try {
      Response response = await Dio().post(
        'https://elsewedyteam.runasp.net/api/Login/RegisterUser',
        data: {'Name': name, 'Email': email, 'Password': password,'Phone':Phone},
      );
      return Authmodel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (othererror) {
      throw Exception(othererror.toString());
    }
}
 }