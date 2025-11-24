import 'package:bloc/bloc.dart';

import 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(CompaniesInitial());

  bool isListView = false;
  bool isFavourites = false;

  void switchToGrid() {
    isListView = !isListView;
    emit(SwitchViewState(isListView));
  }

  void addToFavourites() {
    isFavourites = !isFavourites;
    emit(SwitchViewState(isFavourites));
  }
}
