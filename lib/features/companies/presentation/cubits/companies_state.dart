class CompaniesState {}

final class CompaniesInitial extends CompaniesState {}

class SwitchViewState extends CompaniesState {
  final bool isList;
  SwitchViewState(this.isList);
}
