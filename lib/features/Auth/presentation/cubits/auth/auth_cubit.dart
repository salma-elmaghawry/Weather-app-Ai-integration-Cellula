import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/Auth/data/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepo.registerUser(email, password);
      emit(AuthSuccess("Registration successfully\n Welcome to WeatherWise!"));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An unknown error occurred. Please try again.';
      }
      emit(AuthError(errorMessage));
    } catch (e) {
      emit(AuthError("An unknown error occurred. Please try again."));
    }
  }
  

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepo.loginUser(email, password);
      emit(AuthSuccess('Login successfully\n Welcome back!'));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = 'An unknown error occurred. Please try again.';
      }
      emit(AuthError(errorMessage));
    } catch (e) {
      emit(AuthError('An unknown error occurred. Please try again.'));
    }
  }
}
