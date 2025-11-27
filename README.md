# Company Task App

- Assessment project for **Link Development**  

- A Flutter application for browsing and filtering companies with full **infinite pagination**, search, view modes, and favorites support — built with a clean, scalable structure.

## 🚀 Features

- **Company Listing:** View a paginated list of companies with infinite scroll.
- **Search & Filter:** Filter companies by city, sub-categories, and type, or search by name.
- **View Modes:** Toggle between List view and Grid view.
- **Favorites:** Mark companies as favorites.
- **Pagination:** Automatic loading of more companies when scrolling to the bottom.
- **Responsive Design:** Adapts to different screen sizes using `flutter_screenutil`.

## 🛠 Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** flutter_bloc (Cubit)
- **Architecture:** 2-Layer Architecture (Data + Presentation)
- **Dependency Injection:** get_it
- **Networking:** dio
- **Functional Programming:** dartz (Either type for error handling)
- **UI:** flutter_screenutil, cached_network_image, flutter_svg

## 📂 Architecture

This project follows a **simplified 2-layer architecture** with clear separation of concerns:

### Layers:

#### 1. **Data Layer**
Handles all data operations, business logic, and external communications.

- **Models:** 
  - `CityModel` - City data structure
  - `SubCategoryModel` - Sub-category data structure
  - `CompanyModel` - Company data structure with all details
  - `PaginationModel` - Pagination metadata (currentPage, lastPage, total, perPage)
  - `CompaniesResponseModel` - Wrapper containing companies list and pagination info

- **Repository (Interface):**
  - `CompaniesRepository` - Abstract class defining data operations contract

- **Repository (Implementation):**
  - `CompaniesRepositoryImpl` - Concrete implementation handling:
    - API calls via `ApiConsumer`
    - JSON parsing to models
    - Error handling with `Either<Failure, Success>`
    - **Pagination support** with page parameter

- **Data Sources:**
  - `ApiConsumer` (via `DioConsumer`) - Handles HTTP requests

#### 2. **Presentation Layer**
Manages UI state and user interactions.

- **Cubits:**
  - `CompaniesCubit` - Manages companies state including:
    - Loading cities and sub-categories
    - Filtering companies with pagination
    - **Load more companies** (infinite scroll)
    - Search functionality
    - Toggle favorite
    - Switch view mode (list/grid)

- **States:**
  - `CompaniesState` - Base state
  - `FilterCompaniesLoading` - Initial loading
  - `FilterCompaniesSuccess` - Data loaded
  - `FilterCompaniesError` - Error occurred
  - `LoadMoreCompaniesLoading` - Loading next page
  - `LoadMoreCompaniesError` - Error loading next page

- **Widgets:**
  - `CompaniesBody` - Main container with scroll listener
  - `CompaniesListView` - List layout with pagination indicator
  - `CompaniesGridView` - Grid layout with pagination indicator
  - `CompaniesListItem` - Individual company card (list)
  - `CompanyGridItem` - Individual company card (grid)

## 🔄 Pagination Implementation

### How Pagination Works:

1. **Initial Load:**
   - User applies filters → `filterCompanies()` called with `page = 1`
   - Response contains companies + pagination metadata
   - Cubit stores `currentPage` and `lastPage`

2. **Load More:**
   - User scrolls to bottom → `ScrollNotification` detected
   - `loadMoreCompanies()` called if `currentPage < lastPage`
   - Request sent with `page = currentPage + 1`
   - New companies appended to existing list

3. **State Management:**
   ```dart
   int currentPage = 1;      // Current page number
   int lastPage = 1;         // Total pages available
   bool isLoadingMore = false; // Prevent duplicate requests
   ```

4. **API Request:**
   ```dart
   "${EndPoints.filterCompanies}?page=$page"
   ```

5. **Response Structure:**
   ```json
   {
     "data": {
       "data": [...companies],
       "pagination": {
         "current_page": 2,
         "last_page": 5,
         "total": 100,
         "per_page": 20
       }
     }
   }
   ```

## ⚙️ Setup & Installation

### Prerequisites:
- Flutter SDK (latest stable version)
- Dart SDK
- IDE (VS Code or Android Studio) with Flutter plugins

### Installation Steps:

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd company_task
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

## 🏃‍♂️ Running the Project

- **Development Mode:**
  ```bash
  flutter run
  ```

- **Build APK (Release):**
  ```bash
  flutter build apk --release
  ```

- **Build for iOS:**
  ```bash
  flutter build ios --release
  ```

## 🧪 Project Structure

```
lib/
├── core/
│   ├── api/                    # API consumer, endpoints
│   ├── errors/                 # Error handling, failures
│   ├── extensions/             # Dart extensions
│   ├── routes/                 # App routing
│   ├── services/               # Dependency injection (get_it)
│   └── theme/                  # App theme, colors, text styles
│
├── features/
│   └── companies/
│       ├── data/
│       │   ├── models/         # Data models
│       │   │   ├── cities_model.dart
│       │   │   ├── sub_categoreis.dart
│       │   │   ├── companies_model.dart
│       │   │   ├── pagination_model.dart
│       │   │   └── companies_response_model.dart
│       │   └── repos/          # Repository interface & implementation
│       │       ├── companies_repository.dart
│       │       └── companies_repository_impl.dart
│       │
│       └── presentation/
│           ├── cubits/         # State management
│           │   ├── companies_cubit.dart
│           │   └── companies_state.dart
│           ├── views/          # Screens
│           └── widgets/        # UI components
│
└── main.dart                   # Entry point
```

## 🔑 Key Files

- **`companies_repository_impl.dart`** - Handles API calls with pagination
- **`companies_cubit.dart`** - Manages pagination state and load more logic
- **`companies_body.dart`** - Implements scroll listener for infinite scroll
- **`pagination_model.dart`** - Parses pagination metadata from API

## 📝 Notes

- The app uses Arabic locale (`ar`) by default
- Pagination automatically loads when scrolling to the bottom
- Loading indicator appears at the bottom while fetching more data
- Error handling prevents duplicate requests during loading

## 🐛 Debugging Pagination

The repository implementation includes debug logs:
```dart
debugPrint('Pagination - Current Page: ${companiesResponse.pagination.currentPage}');
debugPrint('Pagination - Last Page: ${companiesResponse.pagination.lastPage}');
debugPrint('Pagination - Total: ${companiesResponse.pagination.total}');
debugPrint('Companies Count: ${companiesResponse.companies.length}');
```

Check the console to verify pagination is working correctly.
