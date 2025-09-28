
import 'package:bloc_clean_coding/model/user/userModel.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

class LoginMockRepository implements LoginRepository {
    @override
  Future<UserModel> loginApi(dynamic data) async {
    
    final response = {
      'token': "this_is_from_mock_api"
    };
    
    return UserModel.fromJson( response);
  }

}