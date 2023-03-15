import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

// @JsonSerializable()
// class Photo extends Equatable {
//   //필요한 변수들만 적어준다
//   final int id;
//   final String tags;

//   @JsonKey(name: 'previewURL')
//   final String previewURL;

//   const Photo({
//     required this.id,
//     required this.tags,
//     required this.previewURL,
//   });

//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

//   Map<String, dynamic> toJson() => _$PhotoToJson(this);

//   @override
//   List<Object?> get props => [id];
// }

// import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'photo.freezed.dart';

// part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  factory Photo({
    required int id,
    required String tags,
    required String previewURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
