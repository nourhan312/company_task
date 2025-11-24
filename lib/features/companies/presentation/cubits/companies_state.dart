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
