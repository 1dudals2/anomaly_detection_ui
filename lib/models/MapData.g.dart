// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MapData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapData _$MapDataFromJson(Map<String, dynamic> json) {
  return MapData(
    (json['points'] as List<dynamic>)
        .map((e) => Point.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['segments'] as List<dynamic>)
        .map((e) => Segment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MapDataToJson(MapData instance) => <String, dynamic>{
      'points': instance.points,
      'segments': instance.segments,
    };

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    json['id'] as int,
    json['x'] as int,
    json['y'] as int,
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) {
  return Segment(
    json['id'] as int,
    json['start_point'] as int,
    json['end_point'] as int,
    json['speed'] as int,
    json['length'] as int,
    (json['seg_parts'] as List<dynamic>)
        .map((e) => SegPart.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'id': instance.id,
      'start_point': instance.start_point,
      'end_point': instance.end_point,
      'speed': instance.speed,
      'length': instance.length,
      'seg_parts': instance.seg_parts,
    };

SegPart _$SegPartFromJson(Map<String, dynamic> json) {
  return SegPart(
    json['type'] as String,
    json['location'] != null ? json['location'] as String : "",
    json['direction'] != null ? json['direction'] as String : "",
  );
}

Map<String, dynamic> _$SegPartToJson(SegPart instance) => <String, dynamic>{
      'type': instance.type,
      'location': instance.location,
      'direction': instance.direction,
    };
