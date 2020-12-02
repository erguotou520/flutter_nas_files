// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Host _$HostFromJson(Map<String, dynamic> json) {
  return Host(json['host'] as String, json['port'] as int);
}

Map<String, dynamic> _$HostToJson(Host instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

ConnectConfig _$ConnectConfigFromJson(Map<String, dynamic> json) {
  return ConnectConfig(
      json['protocol'] as String,
      (json['hosts'] as List)
          ?.map((e) =>
              e == null ? null : Host.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['username'] as String,
      json['password'] as String);
}

Map<String, dynamic> _$ConnectConfigToJson(ConnectConfig instance) =>
    <String, dynamic>{
      'protocol': instance.protocol,
      'hosts': instance.hosts,
      'username': instance.username,
      'password': instance.password
    };
