import 'package:dio/dio.dart';

/// More examples see https://github.com/cfug/dio/blob/main/example
void main() async {
  final dio = Dio();
  final response = await dio.get('https://localhost:8443/actuator/health');
  print(response.data);
}