
import 'package:bloc_clean_coding/model/user/userModel.dart';

abstract class LoginRepository {
  
  Future<UserModel> loginApi(dynamic data);

}