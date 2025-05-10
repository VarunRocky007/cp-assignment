abstract class UserRepository {
  Future<bool> login({
    required String username,
    required String password,
  });
  Future<bool> signUp({
    required String username,
    required String password,
    required String emailAddress,
  });
  Future<void> logout();

}