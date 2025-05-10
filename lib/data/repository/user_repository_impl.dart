import 'package:cross_platform_assignment/data/remote_data_source/user_remote_data_source.dart';
import 'package:cross_platform_assignment/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl({
    UserRemoteDataSource? userRemoteDataSource,
  }) : _userRemoteDataSource = userRemoteDataSource ?? UserRemoteDataSource();

  @override
  Future<bool> login({required String username, required String password}) {
    return _userRemoteDataSource.login(
      username: username,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return _userRemoteDataSource.logout();
  }

  @override
  Future<bool> signUp(
      {required String username,
      required String password,
      required String emailAddress}) {
    return _userRemoteDataSource.signUp(
      username: username,
      password: password,
      emailAddress: emailAddress,
    );
  }
}
