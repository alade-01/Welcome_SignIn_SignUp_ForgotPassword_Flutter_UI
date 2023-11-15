import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onboarding_login_register_app_ui/core/RouterGenerator.dart';
import 'package:onboarding_login_register_app_ui/core/constants.dart';
import 'package:onboarding_login_register_app_ui/core/state_manager/ThemeBloc.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ApplicationWithTheme();
  }
}

class ApplicationWithTheme extends StatelessWidget {
  const ApplicationWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
            ),
            child: MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              //navigatorKey: locator<NavigationService>().navigatorKey,
              //supportedLocales: translate.supportedLocales(),
              //title: translate.text("app_name"),
              title: "Onboarding",
              theme: theme,
              debugShowCheckedModeBanner: false,
              initialRoute: RouterGenerator.splashRoute,
              navigatorObservers: [routeObserver],
              onGenerateRoute: (RouteSettings setting) {
                return RouterGenerator.navigate(setting);
              },
            ),
          );
        },
      ),
    );
  }
}
