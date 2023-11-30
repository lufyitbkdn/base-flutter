import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class InterviewDuringPage extends StatefulWidget {
  const InterviewDuringPage({super.key});

  static const String routeName = 'tipsandtricks.interview.during';

  @override
  State<InterviewDuringPage> createState() => _InterviewDuringPageState();
}

class _InterviewDuringPageState extends State<InterviewDuringPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: InterviewDuringPage.routeName,
    title: 'During Your Interview',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'During Your Interview',
        svgIconPath: Assets.assets_images_ico_during_svg,
        iconColor: CivColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  'Breathe slowly, it helps with nervousness. Smile!',
                  'Arrive a little early (but not too early!)',
                  'Engage and connect with other staff at the company (reception and team members).',
                  'Shake hands professionally and firmly and be ready to establish rapport with the interviewer, maybe a bit of small talk as you meet if it is appropriate.',
                  'Make eye contact and be aware of your posture and non-verbal communication.',
                  'Sit forward and avoid fidgeting to show interest and enthusiasm.',
                  "Listen actively and carefully, and don't get distracted.",
                  "Take notes, if you're comfortable doing that (but don't bury your head in your notebook).",
                  "Use your branding statement, 'departure' statement and professional objective!",
                  'Use your STAR stories when answering behavioural/competency-based questions.',
                  'Try not to take over, but still ask questions and uncover as much information as possible about the role.',
                  'Share additional copies of your CV if required.',
                  'If you feel yourself “waffling”, acknowledge it and refocus.',
                  "If you don't understand a question, ask the interviewer to repeat it, don't answer a question if you don't understand what's being asked.",
                  'Thank the interviewer for their time and ask about the next steps - always know what the timeframe and follow-up will be.',
                ],
              ),
              SizedBox(height: Spacing.l_32),
            ],
          )
        ],
      ),
    );
  }
}
