import '../models/class_schedule.dart';

const sampleSchedules = <ClassSchedule>[
  // MONDAY
  ClassSchedule(
    subject: 'Mobile App Development',
    instructor: 'Mr. Santos',
    room: 'NGE101',
    dayOfWeek: DateTime.monday,
    startTime: '7:30 AM',
    endTime: '10:30 AM',
    startHour: 7,
    startMinute: 30,
  ),
  ClassSchedule(
    subject: 'Database Management',
    instructor: 'Ms. Reyes',
    room: 'NGE204',
    dayOfWeek: DateTime.monday,
    startTime: '1:00 PM',
    endTime: '3:00 PM',
    startHour: 13,
    startMinute: 0,
  ),

  // TUESDAY
  ClassSchedule(
    subject: 'Computer Networking',
    instructor: 'Mr. Garcia',
    room: 'Laboratory 2',
    dayOfWeek: DateTime.tuesday,
    startTime: '9:00 AM',
    endTime: '11:00 AM',
    startHour: 9,
    startMinute: 0,
  ),
  ClassSchedule(
    subject: 'Web Systems',
    instructor: 'Ms. Cruz',
    room: 'Room 305',
    dayOfWeek: DateTime.tuesday,
    startTime: '1:00 PM',
    endTime: '3:00 PM',
    startHour: 13,
    startMinute: 0,
  ),

  // WEDNESDAY
  ClassSchedule(
    subject: 'Mobile App Development',
    instructor: 'Mr. Santos',
    room: 'Laboratory 1',
    dayOfWeek: DateTime.wednesday,
    startTime: '8:00 AM',
    endTime: '10:00 AM',
    startHour: 8,
    startMinute: 0,
  ),
  ClassSchedule(
    subject: 'Human-Computer Interaction',
    instructor: 'Ms. Lim',
    room: 'Room 202',
    dayOfWeek: DateTime.wednesday,
    startTime: '7:55 PM',
    endTime: '9:00 PM',
    startHour: 19,
    startMinute: 55,
  ),

  // THURSDAY
  ClassSchedule(
    subject: 'Database Management',
    instructor: 'Ms. Reyes',
    room: 'Room 204',
    dayOfWeek: DateTime.thursday,
    startTime: '9:00 AM',
    endTime: '11:00 AM',
    startHour: 9,
    startMinute: 0,
  ),
  ClassSchedule(
    subject: 'Computer Networking',
    instructor: 'Mr. Garcia',
    room: 'Laboratory 2',
    dayOfWeek: DateTime.thursday,
    startTime: '1:00 PM',
    endTime: '3:00 PM',
    startHour: 13,
    startMinute: 0,
  ),

  // FRIDAY
  ClassSchedule(
    subject: 'Web Systems',
    instructor: 'Ms. Cruz',
    room: 'Room 305',
    dayOfWeek: DateTime.friday,
    startTime: '8:00 AM',
    endTime: '10:00 AM',
    startHour: 8,
    startMinute: 0,
  ),
  ClassSchedule(
    subject: 'Project Development',
    instructor: 'Mr. Dela Cruz',
    room: 'Room 201',
    dayOfWeek: DateTime.friday,
    startTime: '1:00 PM',
    endTime: '3:00 PM',
    startHour: 13,
    startMinute: 0,
  ),
];
