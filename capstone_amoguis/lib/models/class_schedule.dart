class ClassSchedule {
  final String subject;
  final String instructor;
  final String room;
  final int dayOfWeek;
  final String startTime;
  final String endTime;
  final int startHour;
  final int startMinute;

  const ClassSchedule({
    required this.subject,
    required this.instructor,
    required this.room,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.startHour,
    required this.startMinute,
  });

  int get startMinutes => startHour * 60 + startMinute;
}