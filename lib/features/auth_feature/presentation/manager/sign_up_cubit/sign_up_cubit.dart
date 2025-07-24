import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/core/utils/functions/firebase_error_mapper.dart';
import 'package:task_app/features/auth_feature/domain/entities/sign_up_enitity.dart';
import 'package:task_app/features/auth_feature/domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  Future<void> signUp(SignUpEnitity user) async {
    emit(SignUpLoading());
    try {
      await authRepo.signUp(user);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(mapFirebaseAuthError(e.toString())));
    }
  }
}
