import 'package:covid_19/Screen/Model/covid_Model.dart';
import 'package:covid_19/utils/Api_helper.dart';
import 'package:flutter/material.dart';

class CovidProvider extends ChangeNotifier {
  List<CovidModel> list = [];
  List<CovidModel> list1 = [];
  List<CovidModel> SearchList = [];

  void getDataList(List<CovidModel> cList) {
    list = cList;
    list1 = List.from(list);
    // notifyListeners();
  }

  Future<List<CovidModel>> Getdata() {
    return Apihelper.apihelper.ApiData();
  }

  void searchFilter(String search)
  {
    SearchList.clear();
    if(search.isEmpty)
      {
        list1 = List.from(list);
      }
    else
      {
        for(var c1 in list)
          {
            if( c1.country!.toLowerCase().contains(search.toLowerCase()))
              {
                SearchList.add(c1);
              }
            list1 = List.from(SearchList);
          }
      }
    notifyListeners();
  }

}
