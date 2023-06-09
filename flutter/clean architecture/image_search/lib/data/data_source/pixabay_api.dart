import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi{
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = "https://pixabay.com/api/";
  static const key = "17301626-1b749dd042a3e8e62ce78319e";

  Future<Result<Iterable>> fetch(String query) async {
    try{
    final response = await client.get(  Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return Result.success(hits);
    }catch(e){
       return Result.error('Network Error');
    }
    
   
  }
}