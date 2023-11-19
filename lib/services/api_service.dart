import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/modules/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final resopnse = await http.get(url);

    if (resopnse.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(resopnse.body);

      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }

    throw Error();
  }
}
