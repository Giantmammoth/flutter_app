abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "fr": fr
  };
}

final Map<String, String> enUS = {
  'username': 'Username',
  'login': "Sign In"
};

final Map<String, String> fr = {
  'username': "Nom d'utilisateur",
  'login': "Se Connecter"
};