import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  List<Photo> _photos = [];
  //UnmodifiableListView 수정못하는 리스트 타입
  //외부에서 수정하려면 앱이 죽는다

  Future<void> fetch(String query) async {
    _state = state.copy(isLoading: true);

    notifyListeners();
    final Result<List<Photo>> result = await repository.fetch(query);
    // _photoStreamController.add(result);
    result.when(
      success: (photos) {
        _state = state.copy(photos: photos);
        notifyListeners();
        //
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copy(isLoading: false);

    notifyListeners();
  }
}
