import 'package:flutter/material.dart';
import '../data/schedule_data.dart';
import '../widgets/class_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todaySchedules = sampleSchedules
        .where((schedule) => schedule.dayOfWeek == today.weekday)
        .toList()
      ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));

    final isWide = MediaQuery.sizeOf(context).width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule'),
        centerTitle: false,
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
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Here is your class schedule for today.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 24),

                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TODAY'S DATE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${_weekdayName(today.weekday)}, '
                          '${_monthName(today.month)} ${today.day}, ${today.year}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  "Today's Classes",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 12),

                if (todaySchedules.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(Icons.event_available, size: 48),
                          SizedBox(height: 12),
                          Text(
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
