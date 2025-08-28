part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

// ignore: must_be_immutable
final class CategoryResponseState extends CategoryState {
  Either<String, List<CategoryModel>> response;

  CategoryResponseState(this.response);
}
