import 'package:dio/dio.dart';
import 'package:routing_shell_ex/models/cat_fact.dart';

class CatFactsRepository {
  Future<CatFact> getFact({required CancelToken cancelToken}) {
    Future<CatFact> result = Dio().get('https://catfact.ninja/fact').then((response) {
      if (cancelToken.isCancelled) {
        throw Exception('Request cancelled');
      }

      if (response.statusCode == 200) {
        final json = response.data;
        return CatFact(fact: json['fact'], length: json['length']);
      } else {
        throw Exception('Failed to load cat fact');
      }
    });

    return result;
  }
}
