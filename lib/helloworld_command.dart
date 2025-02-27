import 'package:mineral/api.dart';

final class HelloWorldCommand implements CommandDeclaration {
  Future<void> handle(CommandContext ctx) async {
    await ctx.interaction.reply(content: 'Hello Wolrd ! 👋');
  }

  @override
  CommandDeclarationBuilder build() {
    return CommandDeclarationBuilder()
      ..setName('helloworld') //No caps allowed
      ..setDescription('Make your bot say hello')
      ..setHandle(handle);
  }
}
