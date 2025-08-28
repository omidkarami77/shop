import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/data/repository/category_repository.dart';
import 'package:shop/dr.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  ICategoryRepository categoryRepository = locator.get();

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryRequestListEvent>((event, emit) async {
      emit(CategoryLoading());
      var response = await categoryRepository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
