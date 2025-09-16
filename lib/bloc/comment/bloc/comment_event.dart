part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentGetInitializeData extends CommentEvent {
  final String productId;

  CommentGetInitializeData(this.productId);
}

class CommentPostEvent extends CommentEvent {
  final String productId;
  final String comment;

  CommentPostEvent(this.productId, this.comment);
}
