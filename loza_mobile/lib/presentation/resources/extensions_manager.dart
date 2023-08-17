import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/di.dart';

class Extensions
{
  static int extractIdFromToken() {
    final AppPreferences appPreferences = instance<AppPreferences>();
    int id = 1;
    appPreferences.getToken().then((value) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
      id = decodedToken['Id'];
    });
    return id;
  }
}