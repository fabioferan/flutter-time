import 'package:flutter/material.dart';
import 'app/theme/chronos_theme.dart';
import 'core/widgets/chronos_app_scaffold.dart';
import 'core/widgets/chronos_scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlutterTimeApp());
}

class FlutterTimeApp extends StatelessWidget {
  const FlutterTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time App',
      debugShowCheckedModeBanner: false,
      theme: ChronosTheme.darkTheme,
      scrollBehavior: const ChronosScrollBehavior(),
      home: const ChronosAppScaffold(),
    );
  }
}
