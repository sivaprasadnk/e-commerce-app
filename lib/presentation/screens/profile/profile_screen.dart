import 'package:e_comm_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_event.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_state.dart';
import 'package:e_comm_app/presentation/components/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        var user = state.userDetails!;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text('UserId : ${user.userId}'),
              const SizedBox(height: 10),
              Text('Email : ${user.email}'),
              const SizedBox(height: 50),
              CommonButton(
                  callback: () async {
                    context.read<AuthBloc>().add(LogOutEvent(context));
                  },
                  title: 'Logout'),
            ],
          ),
        );
      }),
    );
  }
}
