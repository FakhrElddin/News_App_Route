abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {
  final String errorMessage;

  GetSourcesErrorState({required this.errorMessage});
}

class GetNewsLoadingState extends HomeStates {}

class GetNewsSuccessState extends HomeStates {}

class GetNewsErrorState extends HomeStates {
  final String errorMessage;

  GetNewsErrorState({required this.errorMessage});

}
