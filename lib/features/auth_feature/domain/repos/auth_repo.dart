

import 'package:task_app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:task_app/features/auth_feature/domain/entities/sign_up_enitity.dart';

abstract class AuthRepo {
  Future<void> signUp(SignUpEnitity user);
  Future<void> signIn(SigninEntity user);
}
