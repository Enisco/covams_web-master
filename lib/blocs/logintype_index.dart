import 'package:bloc/bloc.dart';

abstract class LoginTypeInt {}

class LogIn extends LoginTypeInt {}

class LogOut extends LoginTypeInt {}

int loginInt = 0;

class LoginIntBloc extends Bloc<LoginTypeInt, int> {
  LoginIntBloc() : super(0) {
    on<LogOut>((event, emit) => emit(loginInt = 0));
    on<LogIn>((event, emit) => emit(loginInt = loginInt));
  }
}
