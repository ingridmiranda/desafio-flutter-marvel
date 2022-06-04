import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(const AppWidget());
}
