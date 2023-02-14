import 'package:flutter/foundation.dart';

extension IFDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}
