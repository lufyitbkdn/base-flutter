import 'package:civstart/app/app.dart';
import 'package:flutter/material.dart';

class CivCard extends StatelessWidget {
  const CivCard({
    required this.title,
    this.child,
    this.subtitle,
    this.imageAssetName,
    this.primaryButtonTitle,
    this.onPrimaryButtonPressed,
    this.secondaryButtonTitle,
    this.onSecondaryButtonPressed,
    this.actionButton,
    super.key,
  });

  final String title;
  final String? subtitle;
  final String? imageAssetName;
  final VoidCallback? onPrimaryButtonPressed;
  final String? primaryButtonTitle;
  final VoidCallback? onSecondaryButtonPressed;
  final String? secondaryButtonTitle;
  final Widget? child;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    final imageAssetName = this.imageAssetName;
    final primaryButtonTitle = this.primaryButtonTitle;
    final secondaryButtonTitle = this.secondaryButtonTitle;
    final actionButton = this.actionButton;
    final child = this.child;

    return Card(
      elevation: 0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageAssetName != null)
                Image.asset(
                  imageAssetName,
                  fit: BoxFit.cover,
                ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.s_16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: CivText.titleMedium(title)),
                          if (actionButton != null && imageAssetName == null)
                            actionButton,
                        ],
                      ),
                      if (subtitle != null) //
                        CivText.labelMedium(subtitle),
                      if (child != null) //
                        const SizedBox(height: Spacing.xs_8),
                      if (child != null)
                        Flexible(
                          child: child,
                        ),
                      if (primaryButtonTitle != null ||
                          secondaryButtonTitle != null) //
                        const SizedBox(height: Spacing.xs_8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (secondaryButtonTitle != null)
                            CivButton.primaryOutlined(
                              title: secondaryButtonTitle,
                              onPressed: onSecondaryButtonPressed,
                            ),
                          if (primaryButtonTitle != null) ...[
                            const SizedBox(width: Spacing.xs_8),
                            CivButton.primaryFilled(
                              title: primaryButtonTitle,
                              onPressed: onPrimaryButtonPressed,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (actionButton != null && imageAssetName != null)
            Positioned(
              right: Spacing.xs_8,
              top: Spacing.xs_8,
              child: actionButton,
            ),
        ],
      ),
    );
  }
}
