import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/core/utils/functions/firebase_error_mapper.dart';
import 'package:task_app/features/auth_feature/domain/repos/auth_repo.dart';

part 'signin_state.dart';


class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());
  Future<void> signIn(user) async {
    emit(SigninLoading());
    try {
      await authRepo.signIn(user);
      emit(SigninSuccess());
    } catch (e) {
       emit(SigninFailure(errMessage: mapFirebaseAuthError(e.toString())));
    }
  }
}
