import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  static const String routeName = 'more_information.terms_and_conditions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Terms & Conditions',
        svgIconPath: Assets.assets_images_ico_tnc_svg,
        iconColor: CivColors.orange,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.xs_8),
              CivText.bodyMedium(
                  "Welcome to the CivStart app. By accessing this app, you agree to its terms of use and our privacy policy. The Digital Development Factory Pty Ltd (ABN: 38 152 853 800) of 402/50 Holt Street, Surry Hills, NSW 2010 trading as Miroma Project Factory (or 'MPF'), the developer of this app, retains the right to amend these Terms and Conditions at its sole discretion and without notice."),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'If you would like any further information, or have any queries, problems or complaints relating to these terms, please contact our Privacy Officer by e-mail: info@theprojectfactory.com or writing to Miroma Project Factory at our above address.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('No advice'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'The information posted within this app is provided for general information purposes only.  Although MPF attempts to ensure that information is current and accurate, we cannot guarantee its accuracy or currency.  Please seek appropriate professional advice before you act or rely on any of this app’s content.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Intellectual Property'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Use of the information posted on this app for commercial purposes is prohibited without the prior written consent of MPF. Any copying or reproduction of this app or any part of it is prohibited (except to the extent permitted by law) except with the prior written consent of MPF.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Links'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Where links from this app to other websites are provided, MPF makes no representations about the accuracy of information contained on those websites and is not liable for the content of those websites.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Jurisdiction and Limitation'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'This app and its use are governed by the laws of New South Wales, Australia. MPF disclaims any responsibility to the maximum extent permitted by law for any loss suffered in connection with the use of the information posted on this app or the transmission of any computer virus by us.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Privacy'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'MPF and its related entities understand the importance of privacy. MPF has adopted this privacy policy as it recognises the right of our clients and others to keep their personal information private. This privacy policy covers MPF’s treatment of personally identifiable information that we collect or hold. MPF complies with the National Privacy Principles contained in the Privacy Act 1988 (Cth) in dealing with personal information. MPF also complies with the Spam Act 2003 (Cth), which deals with restrictions on sending emails. In this policy, personal information means information or opinions about an individual whose identity is apparent or can reasonably be ascertained from the information. MPF may amend its privacy policy from time to time by updating this app with the amended version. We suggest that you visit this page regularly to keep up to date with any changes.'),
              TextButton(
                onPressed: () => context.goNamed(PrivacyPolicyPage.routeName),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text('View Privacy Policy'),
              ),
              const SizedBox(height: Spacing.l_32),
            ],
          ),
        ],
      ),
    );
  }
}
