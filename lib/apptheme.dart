import 'package:flutter/material.dart';

class AppTheme { 

  AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme:  ColorScheme.fromSeed(
      seedColor: Color(0xff641ee9),
      primary: Color(0xff6c2cf0),
      onPrimary: Color(0xffffffff),
      scrim: Color(0xff000000),
      inversePrimary: Color(0xffcebdff),
      inverseSurface: Color(0xff313033),
      onInverseSurface: Color(0xfff4eff4),
      outlineVariant: Color(0xffcac4cf),
      shadow: Color(0xff000000),
      background: Color(0xfffffbff),
      onBackground: Color(0xff1c1b1e),
      primaryContainer: Color(0xffe8ddff),
      onPrimaryContainer: Color(0xff21005d),
      secondary: Color(0xff615b71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe8def8),
      onSecondaryContainer: Color(0xff1d192b),
      surface: Color(0xfffffbff),
      onSurface: Color(0xff1c1b1e),
      surfaceTint: Color(0xff6c2cf0),
      surfaceVariant: Color(0xffe6e0ec),
      onSurfaceVariant: Color(0xff48454e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      brightness: Brightness.light,
      tertiary: Color(0xff7d5260),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9e3),
      onTertiaryContainer: Color(0xff31101d),
      outline: Color(0xff79757f),
      
    ),   
    
  );

    
  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme:  ColorScheme.fromSeed(
      seedColor: Color(0xFF000000),
      primary: Color(0xFF9ECAFF),
      onPrimary: Color(0xFF003258),
      scrim: Color(0xFF9ECAFF),
      inversePrimary: Color(0xFFD1E4FF),
      inverseSurface: Color(0xFFD1E4FF),
      onInverseSurface: Color(0xFFD1E4FF),
      outlineVariant: Color(0xFF9ECAFF),
      shadow: Color(0xFF9ECAFF),
      background: Color(0xFF17191B),
      onBackground: Color(0xFFF5F5F6),
      primaryContainer: Color(0xFF00497D),
      onPrimaryContainer: Color(0xFFD1E4FF),
      secondary: Color(0xFFBBC7DB),
      onSecondary: Color(0xFF253140),
      secondaryContainer: Color(0xFF3B4858),
      onSecondaryContainer: Color(0xFFD7E3F7),
      surface: Color(0xFF17191B),
      onSurface: Color(0xFFE2E2E6),
      surfaceTint: Color(0xFFDADDE2),
      surfaceVariant: Color(0xFFB0B3BA),
      onSurfaceVariant: Color(0xFFD1E4FF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF410002),
      onErrorContainer: Color(0xFFD1E4FF),
      brightness: Brightness.dark,
      tertiary: Color(0xFFD6BEE4),
      onTertiary: Color(0xFF3B2948),
      tertiaryContainer: Color(0xFF4A3956),
      onTertiaryContainer: Color(0xFFF2DAFF),
      outline: Color(0xFF9ECAFF),
      
    ),   
    
  );

    
}

// Theme Usage
