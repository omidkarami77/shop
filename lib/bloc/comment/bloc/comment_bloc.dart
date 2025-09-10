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
  }
}
