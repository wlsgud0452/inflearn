import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';

import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch("apple");

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL":
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g711c3ad0ac6d2b122f56cc46bec5828a1256b904a428911d073691903626c2ad25ce951ade2a52aac95cabe135e3931d774ecd00c1e8a17436415bd8b438ef43_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gc40c0fbc57c34943f09c3705492b456a269869ba4a8280a61b66b0fe840a238ff6fdab538ff75e4d35be383726f470ce874d9b0a46aa3815362044f25159e33f_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 655571,
    "downloads": 380448,
    "collections": 2108,
    "likes": 2020,
    "comments": 256,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g2a227c6b446cf062d32c5c1d783022d3f52d1c88667acf74c46f3941796f584d50070b990bdc6b99d5152d2efa8df3a291ea22c5bd863bff06fa643f555f1ff2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gab2445c99ad10f062eb296c15b2e35adf32b86d0df7a877529e1e502cb0b1c1e7ffc8f031838bb9a23819a7907b94ebb85f3be1c4b874be3fa2d66db8b4e6ae5_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1060934,
    "downloads": 685385,
    "collections": 1422,
    "likes": 1540,
    "comments": 329,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  }
];
