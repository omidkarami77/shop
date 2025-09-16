import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/comment.dart';
import 'package:shop/data/repository/comment_repository.dart';
import 'package:shop/dr.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    ICommentRepository commentRepository = locator.get();
    on<CommentGetInitializeData>((event, emit) async {
      emit(CommentLoadingState());

      final response = await commentRepository.getComments(event.productId);
      emit(CommentRequestSuccessState(response));
    });

    on<CommentPostEvent>((event, emit) async {
      emit(CommentPostLoading(true));

      final response = await commentRepository.postComment(
        event.productId,
        event.comment,
      );
      emit(CommentPostLoading(false));

      emit(CommentPostResponse(response));
    });
  }
}
