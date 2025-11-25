class CompaniesState {}

final class CompaniesInitial extends CompaniesState {}

class SwitchViewState extends CompaniesState {
  final bool isList;
  SwitchViewState(this.isList);
}

class AddToFavouritesState extends CompaniesState {
  final bool isFav;
  AddToFavouritesState(this.isFav);
}

class GetCitiesLoading extends CompaniesState {}

class GetCitiesSuccess extends CompaniesState {}

class GetCitiesError extends CompaniesState {
  final String message;
  GetCitiesError(this.message);
}

class GetSubCategoriesLoading extends CompaniesState {}

class GetSubCategoriesSuccess extends CompaniesState {}

class GetSubCategoriesError extends CompaniesState {
  final String message;
  GetSubCategoriesError(this.message);
}

class FilterCompaniesLoading extends CompaniesState {}

class FilterCompaniesSuccess extends CompaniesState {}

class FilterCompaniesError extends CompaniesState {
  final String message;
  FilterCompaniesError(this.message);
}
