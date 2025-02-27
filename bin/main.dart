import 'package:eau_mineral/embedreply_command.dart';
import 'package:eau_mineral/hellouser_command.dart';
import 'package:eau_mineral/helloworld_command.dart';
import 'package:eau_mineral/userinfoembedreply_command.dart';
import 'package:mineral/api.dart';
import 'package:mineral_cache/providers/memory.dart';

Future<void> main(_, port) async {
  final client = ClientBuilder()
      .setCache((e) => MemoryProvider())
      .setHmrDevPort(port)
      .build();

  client.register(HelloWorldCommand.new);
  client.register(HelloUserCommand.new);
  client.register(EmbedreplyCommand.new);
  client.register(UserInfoEmbedReplyCommand.new);

  client.events.ready((Bot bot) {
    client.logger.info('${bot.username} is ready ! 🚀');
  });

  await client.init();
}
