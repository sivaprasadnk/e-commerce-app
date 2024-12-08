import 'package:e_comm_app/firebase_options.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_comm_app/presentation/bloc/route/route_bloc.dart';
import 'package:e_comm_app/presentation/screens/auth/login/login_screen.dart';
import 'package:e_comm_app/presentation/screens/home/home_screen.dart';
import 'package:e_comm_app/presentation/screens/splash/splash_screen.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:e_comm_app/utils/string_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<RouteBloc>(create: (_) => RouteBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Comm App',
        routes: {
          splashScreenRoute: (context) => const SplashScreen(),
          logInScreenRoute: (context) => const LoginScreen(),
          homeScreenRoute: (context) => const HomeScreen(),
        },
        initialRoute: splashScreenRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: FutureBuilder(
        //     future: locator<CheckIsLoggedIn>().call(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         if (snapshot.data!) {
        //           return const HomeScreen();
        //         }
        //         return const LoginScreen();
        //       }
        //       return const CircularProgressIndicator();
        //     }),
      ),
    );
  }
}
