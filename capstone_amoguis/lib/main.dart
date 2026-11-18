import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/timetable_screen.dart';
import 'theme_controller.dart';
import 'widgets/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  await themeController.loadTheme();

  runApp(ClassScheduleApp(themeController: themeController));
}

class ClassScheduleApp extends StatelessWidget {
  final ThemeController themeController;

  const ClassScheduleApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Class Schedule Viewer',

          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(
                  seedColor: const Color(0xFF800000),
                ).copyWith(
                  primary: const Color(0xFF800000),
                  secondary: const Color(0xFFFFD700),
                ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(
                  seedColor: const Color(0xFF800000),
                  brightness: Brightness.dark,
                ).copyWith(
                  primary: const Color(0xFFFFB3B3),
                  secondary: const Color(0xFFFFD700),
                ),
          ),

          themeMode: themeController.themeMode,

          home: MainNavigation(themeController: themeController),
        );
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  final ThemeController themeController;

  const MainNavigation({super.key, required this.themeController});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(themeController: widget.themeController),
      const TimetableScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: AppNavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
