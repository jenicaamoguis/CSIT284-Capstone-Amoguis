import 'package:flutter/material.dart';

import '../data/schedule_data.dart';
import '../theme_controller.dart';
import '../widgets/class_card.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController;

  const HomeScreen({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final todaySchedules =
        sampleSchedules
            .where((schedule) => schedule.dayOfWeek == today.weekday)
            .toList()
          ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));

    final isWide = MediaQuery.sizeOf(context).width >= 600;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule Viewer'),
        actions: [
          PopupMenuButton<ThemeMode>(
            tooltip: 'Change appearance',
            icon: const Icon(Icons.palette_outlined),
            onSelected: (mode) {
              themeController.setThemeMode(mode);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    Icon(Icons.settings_brightness),
                    SizedBox(width: 12),
                    Text('System Default'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    Icon(Icons.light_mode_outlined),
                    SizedBox(width: 12),
                    Text('Light Mode'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    Icon(Icons.dark_mode_outlined),
                    SizedBox(width: 12),
                    Text('Dark Mode'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: ListView(
              padding: EdgeInsets.all(isWide ? 28 : 16),
              children: [
                Text(
                  'Welcome, Teknoy!',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Here is your class schedule for today.',
                  style: theme.textTheme.bodyLarge,
                ),

                const SizedBox(height: 24),

                // Combined Date and Live Time Card
                StreamBuilder<DateTime>(
                  stream: Stream.periodic(
                    const Duration(seconds: 1),
                    (_) => DateTime.now(),
                  ),
                  initialData: DateTime.now(),
                  builder: (context, snapshot) {
                    final currentTime = snapshot.data ?? DateTime.now();

                    return Card(
                      color: colors.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: colors.onPrimaryContainer,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'TODAY',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: colors.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Text(
                              _formatDate(currentTime),
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colors.onPrimaryContainer,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Divider(
                              color: colors.onPrimaryContainer.withValues(
                                alpha: 0.25,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: colors.onPrimaryContainer,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _formatTime(currentTime),
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colors.onPrimaryContainer,
                                      ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Text(
                              'Current local time',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colors.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    Icon(Icons.school_outlined, color: colors.primary),
                    const SizedBox(width: 8),
                    Text(
                      "Today's Classes",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                if (todaySchedules.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.event_available,
                            size: 48,
                            color: colors.primary,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No classes scheduled for today.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...todaySchedules.map(
                    (schedule) => ClassCard(schedule: schedule),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${_weekdayName(date.weekday)}, '
        '${_monthName(date.month)} ${date.day}, ${date.year}';
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final second = time.second.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute:$second $period';
  }

  String _weekdayName(int day) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return days[day - 1];
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }
}
