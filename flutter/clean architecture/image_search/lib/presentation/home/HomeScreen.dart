import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';

import 'package:image_search/presentation/home/components/photo_widget.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  StreamSubscription? _subscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () {
        final viewModel = context.read<HomeViewModel>();

        _subscription = viewModel.eventStream.listen((event) {
          event.when(showSnackBar: ((message) {
            final snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }));
        });
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //모니터링을 해주는 것
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "이미지 검색 앱",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffix: IconButton(
                  onPressed: () async {
                    context.read<HomeViewModel>().fetch(_controller.text);
                    // viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          //provider 전에 Inheritiage
          // StreamBuilder<List<Photo>>(
          //     stream: viewModel.photosStream,
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return const CircularProgressIndicator();
          //       }
          //       final photos = snapshot.data!;
          //       return Expanded(
          //         child: GridView.builder(
          //           padding: EdgeInsets.all(16),
          //           itemCount: photos.length,
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 16,
          //             mainAxisSpacing: 16,
          //           ),
          //           itemBuilder: (context, index) {
          //             final photo = photos[index];
          //             return PhotoWidget(
          //               photo: photo,
          //             );
          //           },
          //         ),
          //       );
          //     }),
          // provider로 변경된것
          // 이렇게 사용하게 되면 provider값이 변경될 때 마다 앱 전채가 빌드된다.
          // 그래서 consumer를 사용한다.
          // Expanded(
          //   child: GridView.builder(
          //     padding: EdgeInsets.all(16),
          //     itemCount: viewModel.photos.length,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 16,
          //       mainAxisSpacing: 16,
          //     ),
          //     itemBuilder: (context, index) {
          //       final photo = viewModel.photos[index];
          //       return PhotoWidget(
          //         photo: photo,
          //       );
          //     },
          //   ),
          // )

          //로딩처리
          state.isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: state.photos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final photo = state.photos[index];
                      return PhotoWidget(
                        photo: photo,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
