import 'package:flutter/material.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;
  PhotoProvider({
    Key? key,
    required this.viewModel,
    required Widget child,
  }) : super(key: key, child: child);
//원하는 위젯 트리에 원하는 객체를 전달한다.

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PxiabayApi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
