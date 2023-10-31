import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreInformationPage extends StatelessWidget {
  const MoreInformationPage({super.key});

  static const String routeName = 'more_information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'More Information',
        svgIconPath: Assets.assets_images_ico_info_svg,
        iconColor: Theme.of(context).colorScheme.onSurface,
        children: [
          PaddedContent(
            children: [
              const ParagraphBreakSpace(),
              CivText.bodyMedium('For legal information and information on our partner organisation, the Defence Force Welfare Association, please access the links below.'),
              const ParagraphBreakSpace(),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_tnc_svg,
                color: CivColors.orange,
                title: 'Terms & Conditions',
                subtitle: 'The legals and conditions',
                onPressed: () => context.goNamed(TermsAndConditionsPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_privacy_svg,
                color: CivColors.orange,
                title: 'Privacy Policy',
                subtitle: 'The legals and your privacy',
                onPressed: () => context.goNamed(PrivacyPolicyPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.image(
                assetPath: Assets.assets_images_lg_dfwa_png,
                title: 'DFWA',
                subtitle: 'Find out more about the DFWA',
                isExternalLink: true,
                onPressed: () => getIt<UrlLauncher>().launchAUrl('https://dfwa.org.au/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
