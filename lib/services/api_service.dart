import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final resopnse = await http.get(url);
    if (resopnse.statusCode == 200) {
      print(resopnse.body);
      return;
    }
    throw Error();
  }
}
