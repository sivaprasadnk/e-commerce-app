import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final BuildContext context;
  LoginEvent(this.context);
}

class LogOutEvent extends AuthEvent {
  final BuildContext context;
  LogOutEvent(this.context);
}

class GetUserDetailsEvent extends AuthEvent {
  final BuildContext context;
  GetUserDetailsEvent(this.context);
}
