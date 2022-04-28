import 'package:bloc/bloc.dart';

abstract class LoginEvent {}

class AdminLoggedIn extends LoginEvent {}

class HospVaccCentreLoggedIn extends LoginEvent {}

class VerifCentreLoggedIn extends LoginEvent {}

class UserLoggedIn extends LoginEvent {}

class LoggedOut extends LoginEvent {}

int loginValue = 0;

List<String> loginStatesString = [
  'Logged Out',
  'Admin Logged In',
  'Hosp-Vacc CentreLogged In',
  'Verif Centre Logged In',
  'User Logged In'
];

class LoginStateBloc extends Bloc<LoginEvent, int> {
  LoginStateBloc() : super(loginValue) {
    on<LoggedOut>((event, emit) => emit(loginValue = 0));
    on<AdminLoggedIn>((event, emit) => emit(loginValue = 1));
    on<HospVaccCentreLoggedIn>((event, emit) => emit(loginValue = 2));
    on<VerifCentreLoggedIn>((event, emit) => emit(loginValue = 3));
    on<UserLoggedIn>((event, emit) => emit(loginValue = 4));
  }
}
