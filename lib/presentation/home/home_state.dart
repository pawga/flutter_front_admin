import 'package:get/get.dart';

class HomeState {
  final status = HomeStatus.initial.obs;
}

enum HomeStatus{
  initial,
  loading,
  loaded,
  error,
}