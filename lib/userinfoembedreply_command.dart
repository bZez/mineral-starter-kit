import 'package:mineral/api.dart';

final class UserInfoEmbedReplyCommand implements CommandDeclaration {
  Future<void> handle(CommandContext ctx, {required Member member}) async {
    final avatartUrl =
        member.assets.avatar?.makeUrl(extension: ImageExtension.png) ??
            'default_avatar_url';
    print(avatartUrl);
    final embed = MessageEmbedBuilder()
      ..setTitle(member.globalName ?? member.nickname ?? member.username)
      ..setDescription('This is the embed description')
      ..setUrl('https://mineral-foundation.org')
      ..setColor(Color('#012D4A'))
      ..setAuthor(
        name: member.username,
        url: 'https://mineral-foundation.org',
        iconUrl: avatartUrl,
        proxyIconUrl: null,
      )
      ..addField(
        name: '👤 **User**',
        value: '${member.globalName ?? member.nickname ?? member.username}',
        inline: true,
      )
      ..addField(
        name: '🏷 **Tag**',
        value: '${member.username}#${member.discriminator}',
        inline: true,
      )
      ..addField(
        name: '🆔 **ID**',
        value: '${member.id}',
        inline: true,
      )
      ..addField(
        name: '🎭 **Nickname**',
        value: '${member.nickname ?? 'None'}',
        inline: true,
      )
      ..addField(
        name: '🌍 **Global Name**',
        value: '${member.globalName ?? 'Not defined'}',
        inline: true,
      )
      ..addField(
        name: '🤖 **Is a bot?**',
        value: '${member.isBot ? 'Yes' : 'No'}',
        inline: true,
      )
      ..addField(
        name: '📅 **Joined the server**',
        value: '${member.joinedAt ?? 'Unknown'}',
        inline: true,
      )
      ..addField(
        name: '🚀 **Boosting since**',
        value: '${member.premiumSince ?? 'Never'}',
        inline: true,
      )
      ..addField(
        name: '🎨 **Accent color**',
        value:
            '${member.accentColor != null ? '#${member.accentColor!.toRadixString(16)}' : 'Default'}',
        inline: true,
      )
      ..addField(
        name: '⚙️ **MFA enabled?**',
        value: '${member.mfaEnabled ? 'Yes' : 'No'}',
        inline: true,
      )
      ..addField(
        name: '🌍 **Language**',
        value: '${member.locale ?? 'Not defined'}',
        inline: true,
      )
      ..addField(
        name: '🏆 **Premium Type**',
        value: '${member.premiumType}',
        inline: true,
      )
      ..addField(
        name: '🚩 **Flags**',
        value:
            '${member.flags.list.isNotEmpty ? member.flags.list.join(', ') : 'None'}',
        inline: true,
      )
      ..addField(
        name: '⏳ **Timeout**',
        value:
            '${member.timeout.isTimeout ? 'Yes (until ${member.timeout.duration})' : 'No'}',
        inline: true,
      )
      ..addField(
        name: '⚖️ **Permissions**',
        value: '${member.permissions.list.join(', ')}',
        inline: true,
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
      ..setName('embedinfo')
      ..setDescription('Display embed message with user info')
      ..setHandle(handle)
      ..addOption(Option.user(
          name: 'member',
          description: 'The user you want to embed info',
          required: true));
  }
}
