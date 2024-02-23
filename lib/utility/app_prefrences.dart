import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Created by Sachin kumar on 17-Feb-2023
/// For CropData Technology Pvt. Ltd.

///[AppPreferences.storeStringValue('keyName', 'keyValue')]
class AppPreferences {
  static storeStringValuePef(String key, String value) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    await prefs.setString(key, value);
  }

  static Future<String?> fetchStringValuePef(String key) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    final result = prefs.getString(key);
    return result;
  }

  static storeIntegerValuePef(String key, int value) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    await prefs.setInt(key, value);
  }

  static Future<int> fetchIntValuePef(String key) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    int result;
    try {
      result = prefs.getInt(key)!;
    } catch (e) {
      result = 0;
    }
    return result;
  }

  static storeDoubleValuePef(String key, double value) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    await prefs.setDouble(key, value);
  }

  static Future<double> fetchDoubleValuePef(String key) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    final result = prefs.getDouble(key);
    return result!;
  }

  static storeBoolValuePef(String key, bool value) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    await prefs.setBool(key, value);
  }

  static Future<bool> fetchBoolValuePef(String key) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    final result = prefs.getBool(key);
    if (result == null) {
      return false;
    }
    return result;
  }

  static removeAValuePef(String key) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //save the data into sharedPreferences using key-value pairs
    await prefs.remove(key);
  }

  static Future<void> clearAllPreferenences() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  // static storeConfigurationData(ConfigurationData data) async {
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   // encode / convert object into json string
  //   String configurationData = jsonEncode(data);
  //   print("Store Preference userdata $configurationData");
  //   //save the data into sharedPreferences using key-value pairs
  //   await prefs.setString(PREF_CONFIGURATION_DATA, configurationData);
  // }

  // static Future<ConfigurationData> fetchConfigurationData() async {
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   // Read the data, decode it and store it in map structure
  //   Map<String, dynamic> jsondatais =
  //       jsonDecode(prefs.getString(PREF_CONFIGURATION_DATA)!);
  //   ConfigurationData data = ConfigurationData.fromJson(jsondatais);
  //   return data;
  // }
}
