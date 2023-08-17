class AppUrl {
  static const String token = "a21804ac83174db575f2eecce7201d51";
  static const String baseUrl = 'https://staging.tradeblindsdirect.com/api/v1';

  static const String loginApi = baseUrl + '/check_login.php';
}

enum ApiStatus {
  idle,
  started,
  completed,
  loading,
  failed
}
