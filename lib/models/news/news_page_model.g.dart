// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPageModel _$NewsPageModelFromJson(Map<String, dynamic> json) =>
    NewsPageModel(
      currentPage: json['currentPage'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => NewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['firstPageUrl'] as String,
      from: json['from'] as int,
      lastPage: json['lastPage'] as int,
      lastPageUrl: json['lastPageUrl'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => NewsLinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['nextPageUrl'] as String,
      path: json['path'] as String,
      perPage: json['perPage'] as String,
      prevPageUrl: json['prevPageUrl'] as String,
      to: json['to'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$NewsPageModelToJson(NewsPageModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'links': instance.links,
      'nextPageUrl': instance.nextPageUrl,
      'path': instance.path,
      'perPage': instance.perPage,
      'prevPageUrl': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
