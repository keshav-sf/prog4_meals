import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog4_meals/tab_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 57, 0),
          ),
          textTheme: GoogleFonts.lateefTextTheme(),
        ),
        home: const SafeArea(
          child: TabScreen(),
        ),
      ),
    ),
  );
}
