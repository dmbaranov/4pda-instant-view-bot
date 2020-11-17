import 'package:dotenv/dotenv.dart' show load, env;
import 'package:fpdabot/fpdabot.dart' as fpdabot;

void main() {
  load();

  var token = env['token'];

  fpdabot.initBot(token);
}
