import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "pseudo": "UserName",
          "connexion": "Sign In",
          "language": "Laguage :",
          "English": "English",
          "French": "French",
          "forgotmdp": "Forgot your password ?"
        },
        "fr_FR": {
          "pseudo": "Nom d'utilisateur",
          "connexion": "Se Connecter",
          "language": "Langage :",
          "English": "Anglais",
          "French": "Français",
          "forgotmdp": "Mot de passe oublié ?"
        },
      };
}
