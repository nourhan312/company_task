import 'package:bloc/bloc.dart';
import '../../domain/repositories/companies_repository.dart';
import 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepository companiesRepository;

  CompaniesCubit({required this.companiesRepository})
    : super(CompaniesInitial());

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
