import 'package:covid_19/Screen/Model/covid_Model.dart';
import 'package:covid_19/utils/Api_helper.dart';
import 'package:flutter/material.dart';

class CovidProvider extends ChangeNotifier
{
  Future<List<CovidModel>> Getdata()
  {
    return Apihelper.apihelper.ApiData();
  }
}