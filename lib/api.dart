import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:newcity/model.dart';
import 'package:retry/retry.dart';

class ApiService extends GetConnect {
  static Dio dio = createDio();
  static String _token = "";
  static String _apiKey = "";

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8000/",
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 30),
    ));
    dio.options.headers = {
      'Connection': 'Keep-Alive',
      'Keep-Alive': 'timeout=5, max=1000',
    };
    return dio;
  }

  static Future<dynamic> postReport(var data) async {
    final response = await dio.post(
      'api/report',
      data: data,
      options: Options(headers: {
        "Accept": "application/json",
      }),
    );
    return response;
  }

  static Future<BeritaResponsePagination?> getPaginationBerita(int page) async {
    try {
      final response = await dio.get(
        'api/berita',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200) {
        return BeritaResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<BeritaResponsePagination?> getBeritaByKategori(id) async {
    try {
      final response = await dio.get('api/berita/category/$id');
      if (response.statusCode == 200) {
        return BeritaResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<KategoriBeritaResponse?> getKategori() async {
    try {
      final response = await dio.get('api/kategori/berita');
      if (response.statusCode == 200) {
        return KategoriBeritaResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<ImageProvider<Object>> loadImage(String imagePath) async {
    final r = RetryOptions(maxAttempts: 30, delayFactor: Duration(seconds: 2));
    final baseUrl = dio.options.baseUrl;
    try {
      String fullUrl = "$baseUrl$imagePath";
      return await r.retry(
        () => Dio().get(fullUrl).then((response) {
          return NetworkImage(fullUrl);
        }),
      );
    } catch (e) {
      print("Error loading image: $e");
      return AssetImage('assets/placeholder.png');
    }
  }
}
