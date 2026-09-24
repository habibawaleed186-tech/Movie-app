import 'dart:convert';

import 'package:movie_app/modules/layout/profile/data/data_source/history_data_source_interface.dart';
import 'package:movie_app/modules/layout/profile/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHistoryDataSource implements HistoryDataSourceInterface{
  static const String historyKey = "Profile History";


  /// ProfileModel              SharedPreferences
  ///     ↓
  /// Map                          JSON String
  ///     ↓
  /// JSON String                     Map
  ///     ↓
  /// SharedPreferences            ProfileModel


  @override
  Future<void> addHistory(ProfileModel movie) async{
    final pref = await SharedPreferences.getInstance();
    final history = await getHistory();

    history.removeWhere( (item)=> item.id == movie.id);
    history.insert(0, movie);

    await pref.setString(historyKey, jsonEncode(history.map((movie)=>movie.toJson()).toList()));

  }



  @override
  Future<List<ProfileModel>> getHistory() async{

   final pref = await SharedPreferences.getInstance();
   final data= pref.getString(historyKey);

   if (data==null){
     return [];
   }
   final List<dynamic> historyList = jsonDecode(data);
   return historyList.map((json)=> ProfileModel.fromJson(json)).toList();

  }

}