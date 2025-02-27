import 'package:mineral/api.dart';
import 'package:mineral/container.dart';

final class EmbedreplyCommand implements CommandDeclaration {
  Future<void> handle(CommandContext ctx) async {
    final bot = ioc.resolve<Bot>();
    final avatartUrl =
        'https://cdn.discordapp.com/avatars/${bot.id}/${bot.avatar}.webp';

    final embed = MessageEmbedBuilder()
      ..setTitle('This is the embed title')
      ..setDescription('This is the embed description')
      ..setUrl('https://mineral-foundation.org')
      ..setColor(Color('#012D4A'))
      ..setAuthor(
        name: bot.username,
        url: 'https://mineral-foundation.org',
        iconUrl: avatartUrl,
        proxyIconUrl: null,
      )
      ..addField(
        name: 'Inline field 1',
        value: 'Inline value 1',
        inline: true,
      )
      ..addField(
        name: 'Inline field 2',
        value: 'Inline value 2',
        inline: true,
      )
      ..addField(
        name: 'Block field 2',
        value: 'Block value 2',
        inline: false,
      )
      ..setImage(
        url: avatartUrl,
        proxyUrl: null,
        height: 1000,
        width: 1000,
      )
      ..setThumbnail(
        url: avatartUrl,
        proxyUrl: null,
        height: 100,
        width: 100,
      )
      ..setVideo(
        url: avatartUrl,
        proxyUrl: null,
        height: 1000,
        width: 1000,
      )
      ..setTimestamp(timestamp: DateTime.now())
      ..setFooter(
        text: 'This is the embed footer',
        iconUrl: avatartUrl,
        proxyIconUrl: null,
      );

    await ctx.interaction.reply(
      embeds: [embed.build()],
    );
  }

  @override
  CommandDeclarationBuilder build() {
    return CommandDeclarationBuilder()
      ..setName('embed')
      ..setDescription('Display complex embed message')
      ..setHandle(handle);
  }
}
