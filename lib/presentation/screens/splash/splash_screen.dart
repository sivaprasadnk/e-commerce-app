import 'package:e_comm_app/domain/use-case/auth/check_is_logged_in.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:e_comm_app/utils/string_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAndRedirect(context);
    });
    super.initState();
  }

  checkAndRedirect(BuildContext context) async {
    var isLoggedIn = await locator<CheckIsLoggedIn>().call();
    if (isLoggedIn) {
      if (context.mounted) {
        Navigator.popAndPushNamed(context, homeScreenRoute);
      }
    } else {
      if (context.mounted) {
        Navigator.popAndPushNamed(context, logInScreenRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
