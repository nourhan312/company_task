class CompaniesState {}

final class CompaniesInitial extends CompaniesState {}

class SwitchViewState extends CompaniesState {
  final bool isList;
  SwitchViewState(this.isList);
}

class ToggleFavouriteState extends CompaniesState {
  final int companyId;
  ToggleFavouriteState(this.companyId);
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

class LoadMoreCompaniesLoading extends CompaniesState {}

class LoadMoreCompaniesError extends CompaniesState {
  final String message;
  LoadMoreCompaniesError(this.message);
}
