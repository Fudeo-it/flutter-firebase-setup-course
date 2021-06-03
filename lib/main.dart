import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:telegram_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Fimber.plantTree(DebugTree());
  runApp(App());
}