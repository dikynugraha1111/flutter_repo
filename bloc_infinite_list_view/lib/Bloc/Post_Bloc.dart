// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:bloc_infinite_list_view/Model/Post.dart';

class PostEvent {}

abstract class PostState {}

// Dipakai untuk dat pertama kalinya
class PostUninitialized extends PostState {}

// Dipakai untuk ngeload data / ketika sudah meload data
class PostLoaded extends PostState {
  List<Post> post;
  // Digunakan untuk mengecek apakah sudah meload semua data yang tersedia
  bool hasReachedMax;

  PostLoaded({required this.post, required this.hasReachedMax});

  PostLoaded copyWith({List<Post>? post, bool? hasReachedMax}) {
    return PostLoaded(
        post: post ?? this.post,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (state is PostUninitialized) {
      posts = await Post.connectToApi(0, 10);
      yield PostLoaded(post: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToApi(postLoaded.post.length, 10);
      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachedMax: true)
          : PostLoaded(post: postLoaded.post + posts, hasReachedMax: false);
    }
  }
}
