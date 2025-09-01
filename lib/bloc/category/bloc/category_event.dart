part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryRequestListEvent extends CategoryEvent {
  CategoryRequestListEvent();
}
