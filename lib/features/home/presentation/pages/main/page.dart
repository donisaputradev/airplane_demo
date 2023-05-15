import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/home/home.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    const HomePage(),
    const TransactionPage(),
    const ShowWalletPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent());
    context.read<DestinationBloc>().add(GetDestinationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: _pages[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (v) {
              context.read<BottomNavBloc>().add(BottomNavChanged(v));
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(CupertinoIcons.globe),
              ),
              BottomNavigationBarItem(
                label: 'History',
                icon: Icon(CupertinoIcons.book),
              ),
              BottomNavigationBarItem(
                label: 'Card',
                icon: Icon(CupertinoIcons.creditcard),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(CupertinoIcons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
