import 'package:dio/dio.dart';

import '../repos/test_repo.dart';

class TestImpl implements TestRepo {
  final Dio dio;

  TestImpl({required this.dio});
  @override
  Future<bool> demoFunc(Map<String, dynamic> req) async {
    try {
      return true;
    } on Exception catch (e) {
      throw UnimplementedError(e.toString());
      // throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
