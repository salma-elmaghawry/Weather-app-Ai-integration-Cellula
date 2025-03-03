import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/Auth/data/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void>register(String email,String password)async
{
  emit(AuthLoading());
  try {
    await authRepo.registerUser(email, password);
    emit(AuthSuccess());
  } catch (e) {
    emit(AuthError(e.toString()));
  }

}
 Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepo.loginUser(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
