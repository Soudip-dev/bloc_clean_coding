import 'package:bloc_clean_coding/config/appUrl.dart';
import 'package:bloc_clean_coding/data/network/networkServicesApi.dart';
import 'package:bloc_clean_coding/model/user/userModel.dart';

class LoginRepository {
    final _api =  NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data) async {
    print("data: $data");
    final response = _api.postApi(data, AppUrl.loginApi);
    print("response: ${response.toString()}");
    return UserModel.fromJson(await response);
  }

}