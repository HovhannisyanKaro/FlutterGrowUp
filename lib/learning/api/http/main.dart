import 'package:http/http.dart' as http;

Future<http.Response> fetchCasinoGamesApi() {
  return http.get(Uri.parse(
      'https://cmsbetconstruct.com/casino/getGames?partner_id=1&lang=eng&is_mobile=1&use_webp=1&country=AM&limit=4'));
}

Future<String> fetchCasinoGames() async {
  final response = await http.get(Uri.parse(
      'https://cmsbetconstruct.com/casino/getGames?partner_id=1&lang=eng&is_mobile=1&use_webp=1&country=AM&limit=4'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load Casino Games');
  }
}
