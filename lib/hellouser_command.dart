import 'package:mineral/api.dart';

final class HelloUserCommand implements CommandDeclaration {
  Future<void> handle(CommandContext ctx, {required Member user}) async {
    await ctx.interaction.reply(content: 'Hello <@${user.id}> ! 👋');
  }

  @override
  CommandDeclarationBuilder build() {
    return CommandDeclarationBuilder()
      ..setName('hellouser') //No caps allowed
      ..setDescription('Make your bot say hello to some user')
      ..setHandle(handle)
      ..addOption(Option.user(
          name: 'user',
          description: 'The user you want to say hello',
          required: true));
  }
}
