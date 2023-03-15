//결과나 에러의 정보를 담는다
//쉴드클래스

import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T>{
  const factory Result.success(T data) = Success;
  const factory Result.error(String message) = Error;
}
// class Success<T>implements Result<T>{
//   final T data;

//   Success(this.data);
// }

// class Error<T>implements Result<T>{
//   final String message;

//   Error(this.message);
// }