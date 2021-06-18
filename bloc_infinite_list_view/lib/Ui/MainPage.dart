import 'package:bloc_infinite_list_view/Bloc/Post_Bloc.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Post_Item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController controller = ScrollController();
  PostBloc? bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) {
      bloc!.add(PostEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScroll);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Infinite ListView"),
      ),
      body: new Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostUninitialized) {
                return Center(
                    child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ));
              } else {
                PostLoaded postLoaded = state as PostLoaded;
                return ListView.builder(
                    controller: controller,
                    itemCount: (postLoaded.hasReachedMax)
                        ? postLoaded.post.length
                        : postLoaded.post.length + 1,
                    itemBuilder: (context, index) {
                      return (index < postLoaded.post.length)
                          ? PostItem(post: postLoaded.post[index])
                          : Container(
                              child: Center(
                                  child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: CircularProgressIndicator(),
                            )));
                    });
              }
            },
          )),
    );
  }
}
