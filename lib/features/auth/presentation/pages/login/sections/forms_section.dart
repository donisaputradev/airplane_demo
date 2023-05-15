part of '../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection();

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(_onChangeEmail);
    passwordController.addListener(_onChangePassword);
    super.initState();
  }

  _onChangePassword() {
    context.read<AuthBloc>().add(PasswordChangeEvent(passwordController.text));
  }

  _onChangeEmail() {
    context.read<AuthBloc>().add(EmailChangeEvent(emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStateStatus.failure) {
            EasyLoading.dismiss();
            EasyLoading.showToast(
              state.failure?.message ?? 'Load data failed!',
            );
          } else if (state.status == AuthStateStatus.loading) {
            FocusScope.of(context).unfocus();
            EasyLoading.show(status: 'Loading...');
          } else if (state.status == AuthStateStatus.authorized) {
            EasyLoading.dismiss();
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainPage.routeName,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegularInput(
                inputType: TextInputType.emailAddress,
                controller: emailController,
                label: 'Email Address',
                hintText: 'Enter email address',
                errorText: state.email.isNotValid
                    ? 'please input a valid email'
                    : null,
              ),
              Dimens.dp16.height,
              PasswordInput(
                controller: passwordController,
                label: 'Password',
                hintText: 'Enter password',
                errorText: state.password.isNotValid
                    ? 'please input at least 6 characters'
                    : null,
              ),
              Dimens.dp32.height,
              ElevatedButton(
                onPressed: state.isAllFormLoginValid
                    ? () {
                        context.read<AuthBloc>().add(SignInEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ));
                      }
                    : null,
                child: const Text('Sign In'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
