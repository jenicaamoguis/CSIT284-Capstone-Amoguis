import 'package:flutter/material.dart';
import '../data/schedule_data.dart';
import '../widgets/class_card.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  int selectedDay = DateTime.monday;

  final List<Map<String, dynamic>> weekdays = [
    {'day': DateTime.monday, 'name': 'Mon'},
    {'day': DateTime.tuesday, 'name': 'Tue'},
    {'day': DateTime.wednesday, 'name': 'Wed'},
    {'day': DateTime.thursday, 'name': 'Thu'},
    {'day': DateTime.friday, 'name': 'Fri'},
    {'day': DateTime.saturday, 'name': 'Sat'},
  ];

  @override
  Widget build(BuildContext context) {
    final selectedSchedules = sampleSchedules
        .where((schedule) => schedule.dayOfWeek == selectedDay)
        .toList()
      ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Timetable'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Your Weekly Classes',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Select a day to view your scheduled classes.',
                ),

                const SizedBox(height: 20),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: weekdays.map((weekday) {
                    final day = weekday['day'] as int;
                    final name = weekday['name'] as String;

                    return ChoiceChip(
                      label: Text(name),
                      selected: selectedDay == day,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedDay = day;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                Text(
                  _fullDayName(selectedDay),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 12),

                if (selectedSchedules.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: Text('No classes scheduled for this day.'),
                      ),
                    ),
                  )
                else
                  ...selectedSchedules.map(
                    (schedule) => ClassCard(schedule: schedule),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _fullDayName(int day) {
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
}
