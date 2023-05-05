part of '../page.dart';

class _FormSection extends StatelessWidget {
  const _FormSection();

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RegularInput(
            label: 'Full Name',
          ),
          Dimens.dp16.height,
          const RegularInput(
            label: 'Email Address',
          ),
          Dimens.dp16.height,
          const PasswordInput(
            label: 'Password',
          ),
          Dimens.dp16.height,
          const RegularInput(
            label: 'Hobby',
          ),
          Dimens.dp32.height,
          ElevatedButton(
            onPressed: () {},
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
