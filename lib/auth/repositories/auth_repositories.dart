import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/http.dart';

class AuthRepositories {
  signIn(AuthModal body) {
    return dio.post("/api/login", data: {
      "email": body.email,
      "password": body.password,
    });
  }

  signOut() {
    return dio.get("/api/logout");
  }

  check() {
    return dio.get("/api/users/me");
  }
}
