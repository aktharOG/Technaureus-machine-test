import 'package:adhoc/src/data/data_sources/auth_remote_data_source.dart';
import 'package:adhoc/src/data/repositories/auth_repository.dart';
import 'package:adhoc/src/presentation/provider/bottom_nav_provider.dart';
import 'package:adhoc/src/presentation/screens/bottom_nav.dart';
import 'package:adhoc/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:adhoc/src/presentation/screens/user_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exports_main.dart';
import 'src/presentation/screens/login/view/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  const String environment =
      String.fromEnvironment('ENV', defaultValue: 'development');
  await EnvLoader.load(fileName: '.env.$environment');
  final authState = AuthStateProvider();
  await authState.initialize();
  runApp(
    ListenableProvider(
      create: (context) => authState,
      child: MyApp(
        authstate: authState,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authstate});
  final AuthStateProvider authstate;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository: AuthRepositoryImpl(
              authDataSource: AuthRemoteDataSourceImpl(
                appUrls: getIt<AppUrls>(),
                sharedPreferencesEntity: SharedPreferencesEntity(),
              ),
            ),
          ),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Ad Hoc Learning',
        theme: ThemeData(
          fontFamily: "Poppins",
          dropdownMenuTheme: DropdownMenuThemeData(
            menuStyle: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColors.white),
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.primary,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
            surfaceTintColor: AppColors.white,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.grey,
            elevation: 0,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textGrey,
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: AppColors.primary,
            selectionColor: AppColors.primary.withOpacity(0.5),
            cursorColor: AppColors.primary,
          ),
          indicatorColor: AppColors.primary,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primary,
            secondary: AppColors.primary,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
          ),
          datePickerTheme: const DatePickerThemeData(
            surfaceTintColor: AppColors.white,
            backgroundColor: AppColors.white,
            headerBackgroundColor: AppColors.primary,
            headerForegroundColor: AppColors.white,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            backgroundColor: AppColors.white,
            alignment: Alignment.center,
            surfaceTintColor: AppColors.white,
          ),
          radioTheme: const RadioThemeData(
            splashRadius: 30,
            fillColor: WidgetStatePropertyAll(AppColors.primary),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primary,
            refreshBackgroundColor: AppColors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(16),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              surfaceTintColor: AppColors.white,
              backgroundColor: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey,
        scaffoldMessengerKey: scaffoldKey,
        initialRoute: context.watch<AuthStateProvider>().authStatus
            ? RouteName.home
            : RouteName.login,
        onGenerateRoute: (settings) {
          //final arguments = settings.arguments;
          final name = settings.name;
          switch (name) {
            case RouteName.login:
              return MaterialPageRoute(
                builder: (context) {
                  return const LoginView();
                },
              );
            case RouteName.home:
              return MaterialPageRoute(
                builder: (context) {
                  return const BottomNavView();
                },
              );

            case RouteName.userDetailScreen:
            final slug  = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) {
                  return  UserDetailScreen(
                    slug: slug,

                  );
                },
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
