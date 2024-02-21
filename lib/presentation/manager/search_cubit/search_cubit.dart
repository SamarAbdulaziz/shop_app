import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/search_cubit/states.dart';
import '../../../domain/use_cases/search_use_case.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchUseCase) : super(SearchInitialState());
  final SearchUseCase searchUseCase;

  static SearchCubit get(context) => BlocProvider.of(context);

  //SearchModel? model;

  Future<void> search(String? text) async {
    emit(SearchLoadingState());
    var result = await searchUseCase(text: text);
    result.fold((failure) {
      emit(SearchErrorState(message: failure.message));
    }, (searchModel) {
      emit(SearchSuccessesState(searchModel: searchModel));
    });

    // DioHelper.postData(
    //   url: SEARCH,
    //   data: {
    //     'text': text,
    //   },
    //   token: token,
    // ).then((value) {
    //   model = SearchModel.fromJson(value.data);
    //   emit(SearchSuccessesState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(SearchErrorState());
    // });
  }
}
