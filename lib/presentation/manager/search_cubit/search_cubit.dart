
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/manager/search_cubit/states.dart';

import '../../../core/constatnt.dart';
import '../../../data/endpoints.dart';
import '../../../data/models/search/search_model.dart';
import '../../../data/remote_data_source/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit  get(context)=>BlocProvider.of(context);

  SearchModel? model;
  void Search( String? Text){
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        'text':Text,
      },
      token: token,
    ).then((value) {
      model=SearchModel.fromJson(value.data);
      emit(SearchSuccessesState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}