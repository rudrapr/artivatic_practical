part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostSuccess extends PostState {
  final String? message;
  final List<PostModel> posts;

  PostSuccess({this.message, required this.posts});
}

class PostFailure extends PostState {
  final String? message;

  PostFailure({this.message});
}
