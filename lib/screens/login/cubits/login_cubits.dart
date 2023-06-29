import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/helper/helpers.dart';
import 'package:mywo/helper/ui_helper.dart';
import 'package:mywo/repository/user/user_repository.dart';

part 'login_state.dart';

BlocProvider<LoginCubit> loginBlocProvider() {
  return BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(),
  );
}

typedef LoginCubitState = CubitState<LoginState>;

class LoginCubit extends AsyncDataCubit<LoginState> {
  LoginCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(initialData: const LoginState());
  final UserRepository _userRepository;

  void onEmailChanged(String email) {
    final emailError =
        email.isEmpty || isEmailValid(email) ? '' : 'Invalid email address';
    emit(
      state.success(
        state.data!.copyWith(
          email: email,
          emailError: emailError,
          isButtonEnabled: email.isNotEmpty &&
              emailError.isEmpty &&
              state.data!.password.isNotEmpty &&
              state.data!.passwordError.isEmpty,
        ),
      ),
    );
  }

  void onPasswordChanged(String password) {
    emit(
      state.success(
        state.data!.copyWith(
          password: password,
          isButtonEnabled: password.isNotEmpty &&
              state.data!.email.isNotEmpty &&
              state.data!.emailError.isEmpty,
        ),
      ),
    );
  }

  Future<void> login() async {
    emit(state.busy());
    showOverlayLoading();
    try {
      await _userRepository.login(state.data!.email, state.data!.password);
      hideOverlayLoading();
      emit(state.navigate(state.data!));
    } catch (e) {
      hideOverlayLoading();
      emit(state.error(exception: e));
    }
  }
}
