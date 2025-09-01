import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/data/repository/category_product_repository.dart';
import 'package:shop/dr.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository categoryProductRepository = locator.get();
  CategoryProductBloc() : super(CategoryProductInitial()) {
    on<CategoryProductGetInitializeData>((event, emit) async {
      emit(CategoryProductLoading());

      final response = await categoryProductRepository.getProductsByCategory(
        event.categoryId,
      );

      emit(CategoryRequestSuccessState(response));
    });
  }
}
