part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetAll extends PostEvent {}

class FilterPost extends PostEvent {
  final String title;

  FilterPost({required this.title});
}
