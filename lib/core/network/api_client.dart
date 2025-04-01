import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/failures.dart';

class ApiClient {
  final String baseUrl;
  final http.Client client;

  ApiClient({
    required this.baseUrl,
    http.Client? client,
  }) : client = client ?? http.Client();

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl$endpoint'));
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ServerFailure(
          message: 'Failed to load data',
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      throw NetworkFailure(
        message: 'Network error occurred',
        code: e.toString(),
      );
    }
  }
} 