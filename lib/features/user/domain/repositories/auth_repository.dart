abstract class AuthRepository {
  Future<void> googleSignIn();
  Future<void> facebookSignIn();
  Future<void> signIn();
}
