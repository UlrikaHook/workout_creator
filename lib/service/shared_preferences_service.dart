import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_creator/models/workout_list.dart';


class SharedPreferencesService {
  static const String _storageObject = "myWorkouts";


  static Future<WorkoutList> getStoredObject() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    String? storedJson = storage.getString(_storageObject);
    Map<String, dynamic> storedObjectMap = jsonDecode('{"workouts": []}');

    if (storedJson != null) {
      try {
        storedObjectMap = jsonDecode(storedJson);
      } on FormatException catch (e) {
        print('The provided string is not valid JSON');
      }
    }

    return WorkoutList.fromJson(storedObjectMap);
  }

  static Future<bool> setStoredObject(
      WorkoutList value) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.setString(_storageObject, jsonEncode(value));
  }
}