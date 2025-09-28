import 'package:bloc_clean_coding/config/appUrl.dart';
import 'package:bloc_clean_coding/data/network/networkServicesApi.dart';
import 'package:bloc_clean_coding/model/user/userModel.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

class LoginHttpRepository implements LoginRepository {
    final _api =  NetworkServicesApi();
    @override
  Future<UserModel> loginApi(dynamic data) async {
    
    final response = _api.postApi(data, AppUrl.loginApi);
    
    return UserModel.fromJson(await response);
  }

}