import 'package:company_task/features/companies/domain/Entities/cities_entities.dart';
import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:company_task/features/companies/domain/Entities/sub_categoreis_entities.dart';
import 'package:company_task/features/companies/domain/usecases/cities_usecases%20.dart';
import 'package:company_task/features/companies/domain/usecases/companies_usecases.dart';
import 'package:company_task/features/companies/domain/usecases/sub_categories_usecases.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final GetCitiesUseCase getCitiesUseCase;
  final GetSubCategoriesUseCase getSubCategoriesUseCase;
  final FilterCompaniesUseCase filterCompaniesUseCase;

  CompaniesCubit({
    required this.getCitiesUseCase,
    required this.getSubCategoriesUseCase,
    required this.filterCompaniesUseCase,
  }) : super(CompaniesInitial());

  bool isListView = true;
  bool isFavourites = false;

  List<CityEntity> cities = [];
  List<SubCategoryEntity> subCategories = [];
  List<CompanyEntity> companies = [];

  // Store filter parameters for search
  List<int> selectedSubCategories = [];
  int selectedCityId = 0;
  String selectedType = '';

  void switchToGrid() {
    isListView = !isListView;
    emit(SwitchViewState(isListView));
  }

  void toggleFavourite(int companyId) {
    companies = companies.map((company) {
      if (company.id == companyId) {
        return CompanyEntity(
          id: company.id,
          name: company.name,
          image: company.image,
          type: company.type,
          description: company.description,
          isFavourite: !company.isFavourite,
          rating: company.rating,
          location: company.location,
        );
      }
      return company;
    }).toList();

    emit(ToggleFavouriteState(companyId));
  }

  Future<void> getCities() async {
    emit(GetCitiesLoading());
    final result = await getCitiesUseCase();
    result.fold((l) => emit(GetCitiesError(l.message)), (r) {
      cities = r;
      emit(GetCitiesSuccess());
    });
  }

  Future<void> getSubCategories() async {
    emit(GetSubCategoriesLoading());
    final result = await getSubCategoriesUseCase();
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
    // Store filter parameters for search
    selectedSubCategories = subCategories;
    selectedCityId = cityId;
    selectedType = type;

    emit(FilterCompaniesLoading());
  
    final result = await filterCompaniesUseCase(
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

  // search
  Future<void> searchCompanies(String query) async {
    if (query.isEmpty) {
      await filterCompanies(
        subCategories: selectedSubCategories,
        cityId: selectedCityId,
        type: selectedType,
      );
    } else {
      // Search with query
      await filterCompanies(
        subCategories: selectedSubCategories,
        cityId: selectedCityId,
        type: selectedType,
        search: query,
      );
    }
  }
}
