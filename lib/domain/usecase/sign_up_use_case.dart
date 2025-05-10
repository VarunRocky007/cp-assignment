import 'package:cross_platform_assignment/data/repository/user_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/user_repository.dart';

class SignUpUseCase {
  final UserRepository userRepository;

  SignUpUseCase({UserRepository? userRepository})
      : userRepository = userRepository ?? UserRepositoryImpl();

  Future<bool> execute({
    required String username,
    required String password,
    required String emailAddress,
  }) {
    return userRepository.signUp(
      username: username,
      password: password,
      emailAddress: emailAddress,
    );
  }
}