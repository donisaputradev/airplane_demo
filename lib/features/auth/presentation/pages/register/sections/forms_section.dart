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
            hintText: 'Enter full name',
          ),
          Dimens.dp16.height,
          const RegularInput(
            label: 'Email Address',
            hintText: 'Enter email address',
          ),
          Dimens.dp16.height,
          const PasswordInput(
            label: 'Password',
            hintText: 'Enter password',
          ),
          Dimens.dp16.height,
          const RegularInput(
            label: 'Hobby',
            hintText: 'Enter hobby',
          ),
          Dimens.dp16.height,
          RegularInput(
            label: 'Foto',
            hintText: 'Upload foto',
            prefixIcon: Icons.camera_alt_rounded,
            onTap: () {},
            readOnly: true,
          ),
          Dimens.dp32.height,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                WalletPage.routeName,
                (route) => false,
              );
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
