import 'package:json_annotation/json_annotation.dart';

part 'MapData.g.dart';
@JsonSerializable()
class MapData{
  List<Point> points ;
  List<Segment> segments ;
  MapData(
      this.points,
      this.segments
      );
  factory MapData.fromJson(Map<String, dynamic> json) => _$MapDataFromJson(json);
  Map<String, dynamic> toJson() => _$MapDataToJson(this);

  static Point findPointById( int id, MapData map){
    return(map.points.firstWhere((element) => element.id == id));
  }

}

@JsonSerializable()
class Point{
  int id;
  double x;
  double y;
  Point(
      this.id,
      this.x,
      this.y
      );
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}
@JsonSerializable()
class Segment{
  int id;
  int start_point;
  int end_point;
  int speed;
  int length;

  List<SegPart> seg_parts;

  Segment(
      this.id,
      this.start_point,
      this.end_point,
      this.speed,
      this.length,
      this.seg_parts
      );
  factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);
  Map<String, dynamic> toJson() => _$SegmentToJson(this);

}
@JsonSerializable()
class SegPart{
  String type;
  String location;
  String direction;
  SegPart(
      this.type,
      this.location,
      this.direction
      );
  factory SegPart.fromJson(Map<String, dynamic> json) => _$SegPartFromJson(json);
  Map<String, dynamic> toJson() => _$SegPartToJson(this);
}
