import '../../../data/models/search/search_model.dart';

abstract class SearchStates{}
class SearchInitialState extends SearchStates{}
class SearchLoadingState extends SearchStates{}
class SearchSuccessesState extends SearchStates{
  final SearchModel searchModel;

  SearchSuccessesState({required this.searchModel});
}
class SearchErrorState extends SearchStates{
  final String message;

  SearchErrorState({required this.message});
}