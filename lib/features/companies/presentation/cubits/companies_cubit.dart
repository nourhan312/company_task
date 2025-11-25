import 'package:bloc/bloc.dart';
import '../../data/models/cities_model.dart';
import '../../data/models/companies_model.dart';
import '../../data/models/sub_categoreis.dart';
import '../../domain/repositories/companies_repository.dart';
import 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepository companiesRepository;

  CompaniesCubit({required this.companiesRepository})
    : super(CompaniesInitial());

  bool isListView = false;
  bool isFavourites = false;

  List<CityModel> cities = [];
  List<SubCategoreisModel> subCategories = [];
  List<CompaniesModel> companies = [];

  void switchToGrid() {
    isListView = !isListView;
    emit(SwitchViewState(isListView));
  }

  void addToFavourites() {
    isFavourites = !isFavourites;
    emit(SwitchViewState(isFavourites));
  }

  Future<void> getCities() async {
    emit(GetCitiesLoading());
    final result = await companiesRepository.getCities();
    result.fold((l) => emit(GetCitiesError(l.message)), (r) {
      cities = r;
      emit(GetCitiesSuccess());
    });
  }

  Future<void> getSubCategories() async {
    emit(GetSubCategoriesLoading());
    final result = await companiesRepository.getSubCategories();
    result.fold((l) => emit(GetSubCategoriesError(l.message)), (r) {
      subCategories = r;
      emit(GetSubCategoriesSuccess());
    });
  }

  Future<void> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
  }) async {
    emit(FilterCompaniesLoading());
    final result = await companiesRepository.filterCompanies(
      subCategories: subCategories,
      cityId: cityId,
      type: type,
      search: search,
    );
    result.fold((l) => emit(FilterCompaniesError(l.message)), (r) {
      companies = r;
      emit(FilterCompaniesSuccess());
    });
  }
}
