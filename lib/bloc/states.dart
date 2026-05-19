abstract class HomeStates {
  final String? errorMessage;
  HomeStates({this.errorMessage});
}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {
  GetSourcesErrorState({required String errorMessage}) : super(errorMessage: errorMessage);
}

class GetNewsLoadingState extends HomeStates {}

class GetNewsSuccessState extends HomeStates {}

class GetNewsErrorState extends HomeStates {
  GetNewsErrorState({required String errorMessage}) : super(errorMessage: errorMessage);
}

class ChangeSelectedTabState extends HomeStates {}