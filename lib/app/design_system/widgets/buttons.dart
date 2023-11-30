import 'package:civstart/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum _ButtonKind {
  primaryFilled,
  primaryOutlined,
  secondaryFilled,
  secondaryOutlined,
}

class CivButton extends StatelessWidget {
  const CivButton.primaryFilled({
    required this.title,
    super.key,
    this.onPressed,
  }) : _buttonKind = _ButtonKind.primaryFilled;

  const CivButton.primaryOutlined({
    required this.title,
    super.key,
    this.onPressed,
  }) : _buttonKind = _ButtonKind.primaryOutlined;

  const CivButton.secondaryFilled({
    required this.title,
    super.key,
    this.onPressed,
  }) : _buttonKind = _ButtonKind.secondaryFilled;

  const CivButton.secondaryOutlined({
    required this.title,
    super.key,
    this.onPressed,
  }) : _buttonKind = _ButtonKind.secondaryOutlined;

  final VoidCallback? onPressed;
  final String title;
  final _ButtonKind _buttonKind;

  @override
  Widget build(BuildContext context) {
    const secondaryColor = Color(0xFF404040);
    final theme = Theme.of(context);
    final secondaryTheme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        outline: secondaryColor,
        primary: secondaryColor,
      ),
    );

    return switch (_buttonKind) {
      _ButtonKind.primaryFilled => FilledButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      _ButtonKind.primaryOutlined => OutlinedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      _ButtonKind.secondaryFilled => Theme(
          data: secondaryTheme,
          child: FilledButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ),
      _ButtonKind.secondaryOutlined => Theme(
          data: secondaryTheme,
          child: OutlinedButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ),
    };
  }
}

class ListTileButton extends StatelessWidget {
  const ListTileButton({
    required this.leading,
    required this.title,
    super.key,
    this.subtitle,
    this.onPressed,
    this.isExternalLink = false,
  });

  ListTileButton.svg({
    required String svgPath,
    required Color color,
    required this.title,
    super.key,
    this.subtitle,
    this.onPressed,
    this.isExternalLink = false,
  }) : leading = SvgPicture.asset(
          svgPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: iconSize,
          height: iconSize,
        );

  ListTileButton.image({
    required String assetPath,
    required this.title,
    super.key,
    this.subtitle,
    this.onPressed,
    this.isExternalLink = false,
  }) : leading = Image.asset(
          assetPath,
          width: iconSize,
          height: iconSize,
        );

  static const iconSize = 40.0;

  final Widget leading;
  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;
  final bool isExternalLink;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;

    return Opacity(
      opacity: onPressed == null ? 0.5 : 1,
      child: Shadowed(
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: InkWell(
            onTap: onPressed,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              leading: leading,
              title: CivText.titleMedium(title),
              subtitle: subtitle != null
                  ? CivText.labelMedium(
                      subtitle,
                      mergeStyleWith: const TextStyle(height: 1.3),
                    )
                  : null,
              trailing: Icon(
                isExternalLink
                    ? Icons.open_in_new
                    : Icons.arrow_forward_ios_outlined,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
