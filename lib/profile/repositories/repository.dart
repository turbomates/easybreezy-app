import 'package:easybreezy_app/http.dart';

class ProfileRepository {
  fetch(String id) {
    return dio
        .get("https://easybreezy.tmsoft.dev/api/hr/employee/$id")
        .then((value) {
      return value.data['data'];
    }).catchError((onError) => null);
  }
}
