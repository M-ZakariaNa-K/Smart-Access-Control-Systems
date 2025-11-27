import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example/helper/network_util.dart';
import '../model/profile_model.dart';

class ProfileService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: '${$.URL}'),
  );

  Future<ProfileModel?> getProfile(String token) async {
    log("zak profile $token");
    try {
      final response = await _dio.get(
        '/profile',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      log("zak $response");
      if (response.statusCode == 200 && response.data['data'] != null) {
        final data = response.data['data'] as Map<String, dynamic>;
        return ProfileModel.fromMap(data);
      } else {
        print('Unexpected response: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print(
          'Dio error while fetching profile: ${e.response?.data ?? e.message}');
    } catch (e) {
      print('Unknown error in ProfileService: $e');
    }
    return null;
  }
}
