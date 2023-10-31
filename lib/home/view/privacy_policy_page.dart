import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const String routeName = 'more_information.privacy_policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Privacy Policy',
        svgIconPath: Assets.assets_images_ico_privacy_svg,
        iconColor: CivColors.orange,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.xs_8),
              CivText.bodyMedium('This Privacy Policy applies to personal information that Miroma Project Factory (MPF) collects and how we use it. Your privacy is very important to us and we will act in a responsible manner with respect to any personal information that we may collect. We recognise the importance of your privacy, and that you have a right to control how your personal information is collected and used. This Privacy Policy is intended to comply with the Privacy Act 1988.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('The information we collect'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('During the course of dealing with you, MPF may collect basic personal information about you, such as your name, phone number and email address. We may also collect other specific information from you relating to the services or advice you wish to obtain. Where practicable, the purpose for which we collect personal information and the consequences of not providing it will be made clear at the time of collection. Users can use this app without revealing who they are or other personal information. MPF will not collect any personal information about visitors except when they knowingly provide it. If you provide us with personal information through this app we may log your usage of the service. Please see our Privacy Policy for further information.'),
               const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('How we use your information'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('MPF will use the personal information we collect for the purpose disclosed at the time of collection or otherwise as set out in this Privacy Policy. We will not use your personal information for any other purpose without first seeking your consent, unless authorised or required by law. We will not disclose any information, unless required by law or if we believe it necessary to provide you with a service you have requested. We may also do so to implement our terms of service, protect the rights, property or personal safety of another user, any member of the public or ourselves, or if our assets and operations are transferred to another party as a going concern. We will not disclose your information to other companies without your consent or reasonable expectation.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Access to your information'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('You can access the personal information that MPF holds about you by contacting the MPF as set out above. We will provide you with a copy of your personal information unless we are legally authorised to refuse your request. We may charge a reasonable amount for providing access. If you wish to change personal information that is out of date or inaccurate at any time please contact us. After notice from you, we will take reasonable steps to correct any of your information which is inaccurate, incomplete or out of date. If you wish to have your personal information deleted please let us know and we will delete that information wherever practicable. We may refuse your request to access, amend or delete your personal information in certain circumstances. If we do refuse your request, we will provide you with a reason for our decision and, in the case of amendment, we will note with your personal information that you have disputed its accuracy.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Storage and Security of information'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('MPF will take reasonable steps to keep secure any personal information which it holds and to keep this information accurate and up to date. Personal information is stored in a secure server or secure files. The internet is not always a secure method of transmitting information.  Accordingly, MPF cannot accept responsibility for the security of information you send to or receive from us over the internet or for any unauthorised access or use of that information.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Links to other websites'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Our app may contain links to other sites. These linked sites are not under our control and we are not responsible for the privacy practices of such other sites. We encourage you to be aware of this when you leave our app and to read the privacy statements of every website that collects personal information. This Privacy Policy applies solely to information collected by our app and does not apply to other websites operated by third parties.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Notification of change'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('We reserve the right to review the Privacy Policy at any time and notify you by posting an updated version of the policy in our app. The amended Privacy Policy will apply between us whether or not we have given you specific notice of any change.'),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('How does MPF protect data?'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('MPF takes data protection extremely seriously. We also take uptime, availability and scaleability equally seriously and work to deliver on all of these.'),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium('Involved in this are several principles:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(bullets: [
                "Data always belongs to the user and, when provided to a client, to that client. MPF holds the data on trust - it isn't ours.",
                'That makes us responsible for ensuring the security of the data and protecting the privacy of the users who provide us with their details.',
                'It also extends to creative content such as video, stories, scripts, articles etc. We recognise the investment made in this content and want to ensure its use is only in accordance with the agreed licensing.',
                'Systems that are interconnected need to be complex, but not complicated. Separating out layers, adding in load balancers etc is all part of this.',
                'Testing is only as good as the testers. Assume users will find something you missed and fix this quickly (and look for other things to fix related to this).',
                'Encryption is very important, as is salting and hashing passwords and securing these against theft or unapproved access.',
                'Anonymised trials are just that: anonymous. We need to secure personal data from trial related data. Both of these are vital to a trial being able to prove the results and keep participants completely anonymous.',
                'We use AES 256 bit encryption which is industry standard to secure all that we do.',
                'We ensure that SSL certificates are installed, covering the entire site, app, and services used. MPF supports the Full-site HTTPS movement. The Certificate Authority should be using 2048-bit RSA keys as minimum. SSL certificates should be 256-bit as minimum.',
                'All user input, especially credit cards, passwords, email addresses, etc are encrypted during all transmissions.',
                'Sensitive data is not sent unencrypted via a channel that can be inspected (or is inspectable) by a user locally.',
                'External services are checked for SSL / encryption.',
                'All sensitive user data (credit cards, passwords, etc) is encrypted at all times at rest (in DB, in files on the server, etc).',
                'All user account systems encrypt user passwords using strong, salted cryptographic hashing methods.',
                'SQL Injection; any DB input scripts that take user input are sanitised.',
                "We ensure that all passwords created for software used by the product are of sufficient length and strength: minimum 16 characters, no phrases, and hasn't been used anywhere else before.",
                'We ensure that any security features (encryption, tokenisation) are performed with official or respected libraries, not custom code.',
              ],),
              const SizedBox(height: Spacing.l_32),
            ],
          ),
        ],
      ),
    );
  }
}
