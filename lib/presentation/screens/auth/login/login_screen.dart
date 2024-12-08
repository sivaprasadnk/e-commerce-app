import 'package:e_comm_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_event.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_state.dart';
import 'package:e_comm_app/presentation/bloc/product/product_bloc.dart';
import 'package:e_comm_app/presentation/bloc/product/product_event.dart';
import 'package:e_comm_app/presentation/bloc/route/route_bloc.dart';
import 'package:e_comm_app/presentation/bloc/route/route_event.dart';
import 'package:e_comm_app/presentation/components/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 300),
          const Icon(
            Icons.shopping_cart,
            size: 150,
          ),
          const SizedBox(height: 50),
          // const Text('Login'),
          Center(
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return CommonButton(
                callback: () async {
                  context.read<AuthBloc>().add(LoginEvent(context));
                  context.read<ProductBloc>().add(GetProductsEvent());
                  context.read<RouteBloc>().add(UpdateIndexEvent(0));

                },
                title: 'Sign Up / Sign In with Google',
              );
            }),
          ),
        ],
      ),
    );
  }
}
