import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suitmedia_01/core/utils/network_util.dart';
import 'package:suitmedia_01/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchUsers({int page = 1});
}


class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<UserModel>> fetchUsers({int page = 1}) async {
    try {
      final response = await NetworkUtil.instance.get('users', queryParameters: {
        'page': page,
        'per_page': 10,
      });

      final List data = response.data['data'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch users: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl();
});