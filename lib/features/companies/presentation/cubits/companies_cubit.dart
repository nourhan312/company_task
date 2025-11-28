import 'package:company_task/features/companies/data/models/cities_model.dart';
import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:company_task/features/companies/data/models/companies_response_model.dart';
import 'package:company_task/features/companies/data/models/sub_categoreis.dart';
import 'package:company_task/features/companies/data/repos/companies_repository.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepository companiesRepository;

  CompaniesCubit({required this.companiesRepository})
    : super(CompaniesInitial());

  bool isListView = true;
  bool isFavourites = false;

  List<CityModel> cities = [];
  List<SubCategoryModel> subCategories = [];
  List<CompanyModel> companies = [];

  // Store filter parameters for search
  List<int> selectedSubCategories = [];
  int selectedCityId = 0;
  String selectedType = '';
  String? currentSearch;

  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void switchToGrid() {
    isListView = !isListView;
    emit(SwitchViewState(isListView));
  }

  void toggleFavourite(int companyId) {
    companies = companies.map((company) {
      if (company.id == companyId) {
        return CompanyModel(
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
    List<int>? subCategories,
    int? cityId,
    String? type,
    String? search,
  }) async {
    selectedSubCategories = subCategories ?? [];
    selectedCityId = cityId ?? 0;
    selectedType = type ?? '';
    currentSearch = search;
    currentPage = 1;

    emit(FilterCompaniesLoading());

    final result = await companiesRepository.filterCompanies(
      subCategories: subCategories,
      cityId: cityId,
      type: type,
      search: search,
      page: currentPage,
    );
    result.fold((l) => emit(FilterCompaniesError(l.message)), (
      CompaniesResponseModel r,
    ) {
      companies = r.companies;
      lastPage = r.pagination.lastPage;
      emit(FilterCompaniesSuccess());
    });
  }

  Future<void> loadMoreCompanies() async {
    if (currentPage >= lastPage || isLoadingMore) return;

    isLoadingMore = true;
    emit(LoadMoreCompaniesLoading());

    currentPage++;

    final result = await companiesRepository.filterCompanies(
      subCategories: selectedSubCategories,
      cityId: selectedCityId,
      type: selectedType,
      search: currentSearch,
      page: currentPage,
    );

    isLoadingMore = false;

    result.fold(
      (l) {
        currentPage--; // Revert page increment on error
        emit(LoadMoreCompaniesError(l.message));
      },
      (r) {
        companies.addAll(r.companies);
        lastPage = r.pagination.lastPage;
        emit(FilterCompaniesSuccess());
      },
    );
  }

  // search
  Future<void> searchCompanies(String query) async {
    await filterCompanies(
      subCategories: selectedSubCategories,
      cityId: selectedCityId,
      type: selectedType,
      search: query.isEmpty ? null : query,
    );
  }
}
