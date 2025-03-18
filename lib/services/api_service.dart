import 'package:dio/dio.dart';

class ApiService {
  final String baseUrlLocal = 'http://192.168.1.81:8000/api';
  final String baseUrlProd = 'https://api.example.com';
  final Dio dio = Dio();
  ApiService();
  // Method to fetch data from the API
}