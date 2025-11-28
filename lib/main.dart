import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/routes.dart';
import 'core/services/services_lactor.dart';
import 'core/theme/app_theme.dart';
import 'features/companies/presentation/cubits/bloc_observer.dart';

import 'features/internet_connectivity/cubits/internet_check_cubit.dart';
import 'features/internet_connectivity/cubits/internet_check_state.dart';
import 'features/internet_connectivity/widgets/no_internet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: AppTheme.lightThemeMode(),
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: Routes.companies,
          builder: (context, child) {
            return BlocBuilder<ConnectivityCubit, ConnectivityState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    if (child != null) child,
                    if (state is ConnectivityDisconnected)
                      const Scaffold(body: NoInternetWidget()),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
