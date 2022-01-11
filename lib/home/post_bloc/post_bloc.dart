import 'dart:async';

import 'package:artivatic_practical/home/models/post_model.dart';
import 'package:artivatic_practical/home/services/post_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService _service = PostService();

  List<PostModel> posts = [];

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetAll) {
        try {
          posts.addAll(await _service.getPosts());
          emit(PostSuccess(posts: posts));
        } catch (e) {
          emit(PostFailure(message: e.toString()));
        }
      } else if (event is FilterPost) {
        try {
          List<PostModel> filtered = posts
              .where((element) => element.title!.contains(event.title))
              .toList();
          emit(PostSuccess(posts: filtered));
        } catch (e) {
          emit(PostFailure(message: e.toString()));
        }
      }
    });
  }
}
