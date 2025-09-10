part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentGetInitializeData extends CommentEvent {
  final String productId;

  CommentGetInitializeData(this.productId);
}
