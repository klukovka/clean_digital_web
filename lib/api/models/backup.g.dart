// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backup _$BackupFromJson(Map<String, dynamic> json) => Backup(
      backups:
          (json['backups'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BackupToJson(Backup instance) => <String, dynamic>{
      'backups': instance.backups,
    };
