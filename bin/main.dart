import 'dart:async';

import 'package:dotenv/dotenv.dart' show load, env;
import 'package:fpdabot/fpdabot.dart' as fpdabot;

void main() {
  load();

  var token = env['token'];

  runZonedGuarded(() {
    fpdabot.initBot(token);
  }, (err, stack) {
    print('Error caught');
    print(err);
    print(stack);
  });
}
