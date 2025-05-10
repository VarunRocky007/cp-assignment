import 'package:cross_platform_assignment/data/repository/user_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/user_repository.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepositoryImpl();

  Future<void> execute() {
    return _userRepository.logout();
  }
}