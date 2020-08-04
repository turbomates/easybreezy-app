import 'package:easybreezy_app/auth/modals/modals.dart';
import 'package:easybreezy_app/http.dart';
import 'package:easybreezy_app/modals/modals.dart';

class AuthRepositories {
  signIn(AuthModal body) async {
    try {
      final response = await dio.post("/api/login", data: {
        "email": body.email,
        "password": body.password,
      });
      return Success(data: response.data["data"]);
    } catch (e) {
      if (e.response.statusCode == 401) {
        return Failure(error: "The email or password you entered is incorrect");
      } else {
        return Failure(error: "Something went wrong");
      }
    }
  }

  signOut() async {
    try {
      await dio.get("/api/logout");
      return Success(data: null);
    } catch (e) {
      return Failure(error: "Something went wrong");
    }
  }

  check() async {
    try {
      final response = await dio.get("/api/users/me");
      return Success(data: response.data["data"]);
    } catch (e) {
      return Failure(error: "Something went wrong");
    }
  }
}
