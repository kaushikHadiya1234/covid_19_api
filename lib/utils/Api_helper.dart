
import 'dart:convert';

import 'package:covid_19/Screen/Model/covid_Model.dart';
import 'package:http/http.dart' as http;

class Apihelper
{
  static Apihelper apihelper = Apihelper();

  Future<List<CovidModel>> ApiData()
  async {
    String? link = 'https://corona.lmao.ninja/v2/countries?yesterday=null&sort=null';
    var response = await http.get(Uri.parse(link));

    List json = jsonDecode(response.body);

    List<CovidModel> list = json.map((e)=>CovidModel.fromJson(e)).toList();

    return list ;

  }
}