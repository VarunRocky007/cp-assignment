import 'package:cross_platform_assignment/data/repository/user_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepositoryImpl();

  Future<bool> execute({
    required String username,
    required String password,
  }) {
    return _userRepository.login(
      username: username,
      password: password,
    );
  }
}