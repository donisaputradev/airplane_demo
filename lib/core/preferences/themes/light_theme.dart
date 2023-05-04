import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';

class LightTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;
  static Color disabledTextColor = AppColors.primary[700]!;
  static Color secondaryColor = AppColors.secondary[700]!;
  static Color disabledColor = AppColors.primary[700]!;
  static Color textSolidColor = AppColors.primary[100]!;
  static Color errorColor = AppColors.red;
  static Color dividerColor = AppColors.primary[300]!;
  static Color inputBackgroundColor = AppColors.primary[100]!;
  static Color scaffoldColor = AppColors.primary[900]!;
  static Color cardColor = AppColors.primary;
  static Color appBarColor = AppColors.primary[900]!;

  ColorScheme get scheme => ColorScheme.light(
        primary: primaryColor,
        surface: primaryColor,
        secondary: primaryColor,
      );

  ButtonThemeData get button => ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: disabledTextColor,
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp8,
          horizontal: Dimens.dp24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
      );

  OutlinedButtonThemeData get outlineButton => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(
            color: primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp14),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dp12,
            horizontal: Dimens.dp24,
          ),
          textStyle: text.labelLarge?.copyWith(
            color: primaryColor,
            fontFamily: 'Poppins',
          ),
        ),
      );

  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onPrimary,
          backgroundColor: secondaryColor,
          disabledBackgroundColor: secondaryColor.withOpacity(.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp14),
          ),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dp12,
            horizontal: Dimens.dp24,
          ),
          textStyle: text.labelLarge?.copyWith(
            color: scheme.onPrimary,
            fontFamily: 'Poppins',
          ),
        ),
      );

  CardTheme get card => CardTheme(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
          side: BorderSide(
            color: dividerColor.withOpacity(.3),
          ),
        ),
        color: cardColor,
      );

  AppBarTheme get appBar => AppBarTheme(
        color: appBarColor,
        titleTextStyle: text.titleLarge?.copyWith(
          fontFamily: 'Poppins',
          color: textSolidColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        toolbarTextStyle: text.titleLarge?.copyWith(
          color: textSolidColor,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        elevation: .15,
        shadowColor: dividerColor.withOpacity(0.5),
        iconTheme: IconThemeData(
          color: primaryColor,
          size: Dimens.dp24,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryColor,
          size: Dimens.dp24,
        ),
      );

  InputDecorationTheme get inputDecoration => InputDecorationTheme(
        filled: true,
        fillColor: inputBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: Dimens.dp12,
          horizontal: Dimens.dp16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
          borderRadius: BorderRadius.circular(Dimens.dp14),
        ),
      );

  BottomNavigationBarThemeData get bottomNav => BottomNavigationBarThemeData(
        backgroundColor: cardColor,
        elevation: 8,
        unselectedItemColor: AppColors.secondary,
        selectedLabelStyle: const TextStyle(
          fontSize: Dimens.dp12,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: Dimens.dp12,
          fontFamily: 'Poppins',
        ),
      );

  TabBarTheme get tabBar => TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: primaryColor,
            width: Dimens.dp2,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: primaryColor,
        unselectedLabelColor: disabledTextColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      );

  TextTheme get text => TextTheme(
        bodyLarge: TextStyle(
          color: textSolidColor,
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        // Use for regular text
        bodyMedium: TextStyle(
          color: disabledTextColor,
          fontSize: Dimens.dp12,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        // Use for heading text
        headlineSmall: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimens.dp24,
          fontFamily: 'Poppins',
        ),
        // Use for title text, AppBar
        titleLarge: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w700,
          fontSize: Dimens.dp16,
          fontFamily: 'Poppins',
        ),
        // Use for sub title text
        titleMedium: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimens.dp14,
          fontFamily: 'Poppins',
        ),

        labelLarge: const TextStyle(
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        // Use for caption
        bodySmall: TextStyle(
          fontSize: Dimens.dp10,
          fontFamily: 'Poppins',
          color: disabledTextColor,
        ),
      );

  FloatingActionButtonThemeData get floatingButton =>
      FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        elevation: 2,
      );

  BottomSheetThemeData get bottomSheet => BottomSheetThemeData(
        backgroundColor: scaffoldColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimens.dp20),
          ),
        ),
      );

  DividerThemeData get divider => DividerThemeData(
        color: dividerColor,
        thickness: 1,
      );

  ThemeData get toTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: scaffoldColor,
      disabledColor: disabledColor,
      textTheme: text,
      cardTheme: card,
      appBarTheme: appBar,
      dividerColor: dividerColor,
      unselectedWidgetColor: disabledColor,
      buttonTheme: button,
      inputDecorationTheme: inputDecoration,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      outlinedButtonTheme: outlineButton,
      elevatedButtonTheme: elevatedButton,
      bottomNavigationBarTheme: bottomNav,
      tabBarTheme: tabBar,
      floatingActionButtonTheme: floatingButton,
      bottomSheetTheme: bottomSheet,
      dividerTheme: divider,
      colorScheme: scheme.copyWith(error: errorColor),
    );
  }
}
