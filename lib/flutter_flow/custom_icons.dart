import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _workoutFamily = 'Workout';
  static const String _dailyFamily = 'Daily';

  // Workout
  static const IconData kdumbbell =
      IconData(0xf44b, fontFamily: _workoutFamily);

  // Daily
  static const IconData ktimeSvgrepoCom =
      IconData(0xe801, fontFamily: _dailyFamily);
  static const IconData kgoalSvgrepoCom =
      IconData(0xe802, fontFamily: _dailyFamily);
  static const IconData kdumbbellSvgrepoCom =
      IconData(0xe803, fontFamily: _dailyFamily);
  static const IconData kmealSvgrepoCom =
      IconData(0xe804, fontFamily: _dailyFamily);
}
