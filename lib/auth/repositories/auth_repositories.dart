import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/http.dart';

class AuthRepositories {
  signIn(AuthModal body) {
    return dio.post("/api/login", data: {
      "email": body.email,
      "password": body.password,
    }).then((value) {
      return value.data["data"];
    }).catchError((error) {
      return null;
    });
  }

  signOut() {
    return dio.get("/api/logout").then((value) {
      return true;
    }).catchError((error) {
      return null;
    });
  }

  check() {
    return dio.get("/api/users/me").then((value) {
      return value.data["data"];
    }).catchError((error) {
      return null;
    });
  }
}
