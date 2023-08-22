import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/core/widgets/common_text_field.dart';
import 'package:{{PROJECT_NAME}}/core/widgets/scaffold_custom.dart';
import 'package:{{PROJECT_NAME}}/extensions/extensions.dart';
import 'package:{{PROJECT_NAME}}/helper/ui_helper.dart';
import 'package:{{PROJECT_NAME}}/screens/login/cubits/login_cubits.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

class LoginScreenRoute extends StatelessWidget {
  const LoginScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        loginBlocProvider(),
      ],
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  @override
  void activate() {
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state.status == CubitStatus.navigate) {
          // Navigate to home
        } else if (state.status == CubitStatus.error) {
          showAlertDialog(
            context: context,
            title: 'Error',
            message: state.errorMessage,
          );
        }
      },
      child: ScaffoldCustom(
        showAppBar: false,
        background: const HeaderBackground(),
        body: SafeArea(
          child: Column(
            children: [
              BlocBuilder<LoginCubit, LoginCubitState>(
                builder: (context, state) => CommonTextField(
                  label: 'Email',
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  errorText: state.data!.emailError,
                  onChange: (s) => context.read<LoginCubit>().onEmailChanged(s),
                ),
              ),
              SizedBox(height: Span.s16),
              CommonTextField(
                label: 'Password',
                hint: 'Enter your password',
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                onChange: (s) =>
                    context.read<LoginCubit>().onPasswordChanged(s),
              ),
              SizedBox(height: Span.s32),
              BlocBuilder<LoginCubit, LoginCubitState>(
                builder: (context, state) => CustomButton(
                  buttonText: 'Login',
                  isEnabled: state.data!.isButtonEnabled,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
