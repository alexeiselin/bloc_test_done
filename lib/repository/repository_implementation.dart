import 'dart:math';

import 'package:test_task/repository/repository.dart';

class MockLoginRepositoryImplementation extends LoginRepository {
  @override
  Future<String> checkCode(String phone, String code) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final random = Random().nextBool();
    if (random) {
      return 'token';
    } else {
      throw Exception('Code is incorrect');
    }
  }

  @override
  Future requestSms(String phone) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final random = Random().nextBool();
    if (!random) {
      throw Exception('Server error');
    }
  }
}
