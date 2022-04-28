import 'package:bloc/bloc.dart';

abstract class LoginAppBarEvent {}

class LogIn extends LoginAppBarEvent {}

class LogOut extends LoginAppBarEvent {}

String appbarString = 'My Account';

class AppBarStringBloc extends Bloc<LoginAppBarEvent, String> {
  AppBarStringBloc() : super('My Account') {
    on<LogOut>((event, emit) => emit(appbarString = 'My Account'));
    on<LogIn>((event, emit) => emit(appbarString = appbarString));
  }
}
