import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _timeFamily = 'Time';
  static const String _dietFamily = 'Diet';
  static const String _workoutFamily = 'Workout';

  // MyFlutterApp
  static const IconData kgoalSvgrepoCom1 =
      IconData(0xe801, fontFamily: _myFlutterAppFamily);

  // Time
  static const IconData ktimeSvgrepoCom =
      IconData(0xe801, fontFamily: _timeFamily);

  // Diet
  static const IconData kmealSvgrepoCom =
      IconData(0xe804, fontFamily: _dietFamily);

  // Workout
  static const IconData kdumbbellSvgrepoCom =
      IconData(0xe803, fontFamily: _workoutFamily);
}
