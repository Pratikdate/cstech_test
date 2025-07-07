import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, int>> fetchCallListStats({
  required String listId,
  required String email,
}) async {


  final url = Uri.parse('https://mock-api.calleyacd.com/api/list/$listId');

  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    print(data);

    final pending     = (data['pending']     as num).toInt();
    final called      = (data['called']      as num).toInt();
    final rescheduled = (data['rescheduled'] as num).toInt();

    return {
      'calls':pending+called+rescheduled,
      'pending': pending,
      'called': called,
      'rescheduled': rescheduled,
    };
  } else {
    throw Exception('Failed to load list stats (${response.statusCode})');
  }
}


Future<dynamic> fetchLists({
  required String userId,
  required String email,
}) async {
  final url = Uri.parse(
    'https://mock-api.calleyacd.com/api/list?userId=$userId',
  );

    return await http.get(
      url,
      headers: {'Content-Type': 'application/json'},

    );


}
