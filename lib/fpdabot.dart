import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void initBot(String token) async {
  var telegram = Telegram(token);
  var bot = TeleDart(telegram, Event());

  await bot.start();

  bot.onMessage(entityType: '*').listen(convertUrlToHttps);

  print('Bot is running...');
}

void convertUrlToHttps(TeleDartMessage message) {
  if (message.caption == null) {
    message.reply('Please send a post from 4PDA channel!');
    return;
  }

  var url = message.caption.split('\n').last;

  if (!url.startsWith('http://4pda.ru')) {
    message.reply('Please send a post from 4PDA channel!');
    return;
  }

  var httpsUrl = 'https://' + url.substring(7);
  message.reply(httpsUrl);
}
