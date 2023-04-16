import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as other_http;
import 'package:http_pro/http.dart' as http;

import '../../core/network/dio.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final TextEditingController requestController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final answer = ''.obs;
  final selectedIdx = 0.obs;


  Future<void> submitRequest() async {
    answer.value = '';
    try {
      switch(selectedIdx.value) {
        case 0:
          dio.options.headers['content-Type'] = 'application/json';
          dio.options.headers['Access-Control-Allow-Origin'] = '*';
          dio.options.headers['Access-Control-Allow-Credentials'] = 'true';
          dio.options.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS';
          dio.options.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type';
          dio.options.headers['Accept'] = '*/*';
          dio.get<String>(requestController.text).then((response) {
            answer.value = response.data!;
          }).onError((error, stackTrace) {
            answer.value = error.toString();
          });
          break;
        case 1:
          final uri = Uri.parse(requestController.text);
          Map<String, String> headers =  <String, String>{
            'Content-Type' : 'application/json; charset=utf-8',
            'Access-Control-Allow-Origin' : '*',
            'Access-Control-Allow-Credentials' : 'true',
            'Access-Control-Allow-Methods' : 'GET, POST, OPTIONS',
            'Access-Control-Allow-Headers' : 'Origin, Content-Type',
            'Accept' : '*/*',
          };
          other_http.Response response;

          response = await other_http.get(uri, headers: headers).timeout(const Duration(seconds: 5), onTimeout: () {
            return other_http.Response('TimeoutError', 408); // Request Timeout response status code
          });

          answer.value = utf8.decode(response.bodyBytes);
          break;
        case 2:
          final res = await http.get(requestController.text);
          answer.value = utf8.decode(res.bodyBytes);
          break;
        default:
          break;
      }
    } catch (exp) {
      answer.value = exp.toString();
    }
  }
}
