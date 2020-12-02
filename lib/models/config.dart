import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Host {
  String host;
  int port;
  Host(this.host, this.port);
  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
  Map<String, dynamic> toJson() => _$HostToJson(this);
}

@JsonSerializable()
class ConnectConfig {
  String protocol;
  List<Host> hosts;
  String username;
  String password;
  ConnectConfig(this.protocol, this.hosts, this.username, this.password);
  factory ConnectConfig.fromJson(Map<String, dynamic> json) => _$ConnectConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectConfigToJson(this);
}

class StorageData {
  List<ConnectConfig> configs;
  int configIndex;
  StorageData(this.configs, this.configIndex);
}
