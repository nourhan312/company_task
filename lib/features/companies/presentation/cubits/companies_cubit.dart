import 'package:bloc/bloc.dart';

import 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(CompaniesInitial());

  bool isListView = false;

  void switchToGrid() {
    isListView = !isListView;
    print('Switching view: isListView = $isListView');
    emit(SwitchViewState(isListView));
  }
}
