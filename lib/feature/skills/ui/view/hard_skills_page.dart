import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/skills/data/models/skills_data.dart';
import 'package:my_wo/feature/skills/ui/cubit/hard_skills_cubit.dart';

// TODO(mfeinstein): [26/8/2023] This page might need UX modifications for Android
class HardSkillsPage extends StatefulWidget {
  const HardSkillsPage({super.key});

  static const String routeName = 'hard_skills';

  @override
  State<HardSkillsPage> createState() => _HardSkillsPageState();
}

class _HardSkillsPageState extends State<HardSkillsPage> {
  final bloc = getIt<HardSkillsCubit>();

  /// Shows a CupertinoModalPopup which hosts a CupertinoPicker.
  Future<void> selectHardSkill(List<RankedHardSkill> rankedHardSkills,
      RankedHardSkill? selectedRankedHardSkill,) async {
    var selectedSkillIndex = selectedRankedHardSkill == null
        ? 0
        : rankedHardSkills.indexOf(selectedRankedHardSkill);

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 216,
          // This padding is a default from the docs example. I am leaving it here in case it matches the iOS standards.
          padding: const EdgeInsets.only(top: 6),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoPicker.builder(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: Spacing.l_32,
              scrollController: FixedExtentScrollController(
                initialItem: selectedSkillIndex,
              ),
              onSelectedItemChanged: (selectedItemIndex) {
                selectedSkillIndex = selectedItemIndex;
              },
              childCount: rankedHardSkills.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(rankedHardSkills[index].rank),
                );
              },
            ),
          ),
        );
      },
    );

    await bloc.save(rankedHardSkills[selectedSkillIndex]);
  }

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Your Hard Skills',
        svgIconPath: Assets.assets_images_ico_skillhard_svg,
        iconColor: WoColors.blue,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  'Hard skills are specific abilities, capabilities and skill sets that an individual can possess and demonstrate in a measured way. Hard skills are learnable skills that enable individuals to perform job-specific tasks, or that may be required for a specific job.',),
              const SizedBox(height: Spacing.s_16),
              BlocBuilder<HardSkillsCubit, HardSkillsState>(
                bloc: bloc,
                builder: (context, state) {
                  return switch (state) {
                    HardSkillsStateLoaded(
                      :final rankedHardSkills,
                      :final selectedRankedHardSkill
                    ) =>
                      Column(
                        children: [
                          Center(
                            child: selectedRankedHardSkill == null
                                ? WoButton.primaryOutlined(
                                    title: 'Select your rank',
                                    onPressed: () => selectHardSkill(
                                        rankedHardSkills,
                                        selectedRankedHardSkill,),
                                  )
                                : TextButton(
                                    onPressed: () => selectHardSkill(
                                        rankedHardSkills,
                                        selectedRankedHardSkill,),
                                    child: WoText.titleMedium(
                                      selectedRankedHardSkill.rank,
                                      mergeStyleWith: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor,),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: Spacing.s_16),
                          Center(
                            child: selectedRankedHardSkill == null //
                                ? WoText.bodyMedium(
                                    'Select your rank to see a list of skills that apply to your experience in defence.',)
                                : RankedSkillDescription(
                                    rankedHardSkill: selectedRankedHardSkill,),
                          ),
                        ],
                      ),
                    _ => const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
              const SizedBox(height: Spacing.s_16),
            ],
          ),
        ],
      ),
    );
  }
}

class RankedSkillDescription extends StatelessWidget {
  const RankedSkillDescription({
    required this.rankedHardSkill,
    super.key,
  });

  final RankedHardSkill? rankedHardSkill;

  @override
  Widget build(BuildContext context) {
    final rankedHardSkill = this.rankedHardSkill;
    return rankedHardSkill != null //
        ? BulletList(bullets: rankedHardSkill.hardSkills)
        : const SizedBox.shrink();
  }
}
