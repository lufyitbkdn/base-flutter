import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wo/app/app.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({
    required this.children,
    required this.title,
    required this.svgIconPath,
    required this.iconColor,
    this.appBarActions,
    this.horizontalOffset = -8,
    super.key,
  }) : shouldUseSlivers = false;

  const ContentBody.sliver({
    required List<Widget> slivers,
    required this.title,
    required this.svgIconPath,
    required this.iconColor,
    this.appBarActions,
    this.horizontalOffset = -8,
    super.key,
  })  : children = slivers,
        shouldUseSlivers = true;

  final bool shouldUseSlivers;
  final List<Widget> children;
  final String title;
  final String svgIconPath;
  final Color iconColor;
  final List<Widget>? appBarActions;
  final double horizontalOffset;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        WoSliverAppBar(
          actions: appBarActions,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kContentPaddingSpacing,
                  vertical: Spacing.s_16,
                ),
                child: Transform.translate(
                  offset: Offset(horizontalOffset, 0),
                  child: SvgPicture.asset(
                    svgIconPath,
                    height: 54,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),
              ),
              PaddedContent(children: [WoText.titleLarge(title)]),
              const SizedBox(height: Spacing.xs_8),
              if (!shouldUseSlivers) //
                ...children,
            ],
          ),
        ),
        if (shouldUseSlivers) ...children,
      ],
    );
  }
}

class WoSliverAppBar extends StatelessWidget {
  const WoSliverAppBar({super.key, this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    // TODO(mfeinstein): [21/8/2023] The Flutter team fixed the misalignment of long texts, we need to revisit this widget
    //  with the fixes later when they are released into stable. https://github.com/flutter/flutter/issues/132030
    return SliverAppBar(
      expandedHeight: kToolbarHeight,
      pinned: true,
      stretch: true,
      // TODO(jd): Discover a better way to align the back arrow
      leadingWidth: 74,
      actions: [
        ...?actions,
        const SizedBox(width: Spacing.s_16),
      ],
    );
  }
}

const kContentPaddingSpacing = Spacing.m_25;

class PaddedContent extends StatelessWidget {
  const PaddedContent({
    required this.children,
    this.padding =
        const EdgeInsets.symmetric(horizontal: kContentPaddingSpacing),
    super.key,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = 5.0;

    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}

// (mfeinstein) Still not sure about if this widget is useful as is. have to see
// how it behaves with long line bullets, multiple paragraphs, etc. But should
// be useful for simple cases.
class BulletList extends StatelessWidget {
  const BulletList({required this.bullets, super.key});

  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final bullet in bullets) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We are using the Stack as a hack to position the bullet
              // centered with the text, using the height of the letter "M"
              // to automatically calculate where the bullet point should be
              // centered.
              Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: WoText.bodyMedium('M'),
                  ),
                  const BulletPoint(),
                ],
              ),
              const SizedBox(width: Spacing.s_16),
              Expanded(
                child: WoText.bodyMedium(bullet),
              ),
            ],
          ),
          const SizedBox(height: Spacing.s_16),
        ],
      ]..removeLast(),
    );
  }
}

class ParagraphBreakSpace extends StatelessWidget {
  const ParagraphBreakSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: Spacing.s_16);
  }
}
