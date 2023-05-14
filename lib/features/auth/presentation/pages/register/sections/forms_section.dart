part of '../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection();

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hobbyController = TextEditingController();

  @override
  void initState() {
    nameController.addListener(_onChangeName);
    emailController.addListener(_onChangeEmail);
    passwordController.addListener(_onChangePassword);
    hobbyController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _onChangeName() {
    context.read<AuthBloc>().add(NameChangeEvent(nameController.text));
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
            EasyLoading.show(status: 'Loading...');
          } else if (state.status == AuthStateStatus.authorized) {
            EasyLoading.dismiss();
            Navigator.pushNamedAndRemoveUntil(
              context,
              WalletPage.routeName,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegularInput(
                inputType: TextInputType.name,
                controller: nameController,
                label: 'Full Name',
                hintText: 'Enter full name',
                errorText:
                    state.name.isNotValid ? 'please input a valid name' : null,
              ),
              Dimens.dp16.height,
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
              Dimens.dp16.height,
              RegularInput(
                inputType: TextInputType.name,
                controller: hobbyController,
                label: 'Hobby',
                hintText: 'Enter hobby',
              ),
              Dimens.dp32.height,
              ElevatedButton(
                onPressed: state.isAllFormValid
                    ? () {
                        context.read<AuthBloc>().add(SignUpEvent(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              hobby: hobbyController.text,
                            ));
                      }
                    : null,
                child: const Text('Get Started'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    hobbyController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
