import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:nas_files/models/config.dart';

const configsStoreKey = 'app.configs';
const configIndexStoreKey = 'app.configIndex';

StorageData _data;

Future<StorageData> initConfigData() async {
  if (_data != null) {
    return _data;
  }
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String _configs = _prefs.getString(configsStoreKey);
  try {
    if (_configs.isNotEmpty) {
      List<Map<String, dynamic>> jsons = jsonDecode(_configs);
      List<ConnectConfig> configs = jsons.map((json) {
        return ConnectConfig.fromJson(json);
      }).toList();
      _data = StorageData(configs, _prefs.getInt(configIndexStoreKey));
      return _data;
    }
  } catch (e) {}
  _data = StorageData([], 0);
  return _data;
}

bool hasConfigs() {
  return getCurrentConfig() != null;
}

ConnectConfig getCurrentConfig() {
  return _data.configs[_data.configIndex];
}

void saveConfigs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString(
      configsStoreKey,
      jsonEncode(_data.configs.map((e) {
        e.toJson();
      }).toList()));
}

void addConfig(ConnectConfig config) {
  _data.configs.add(config);
  saveConfigs();
}

void removeConfig(int index) {
  _data.configs.removeAt(index);
  saveConfigs();
}

void updateConfig(ConnectConfig config, int index) {
  _data.configs.removeAt(index);
  _data.configs.insert(index, config);
  saveConfigs();
}

void selectConfig(int index) {
  _data.configIndex = index;
  SharedPreferences.getInstance().then((_prefs) {
    _prefs.setInt(configIndexStoreKey, index);
  });
}
