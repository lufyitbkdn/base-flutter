import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/skills/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoftSkillsPage extends StatefulWidget {
  const SoftSkillsPage({super.key});

  static const String routeName = 'soft_skills';

  @override
  State<SoftSkillsPage> createState() => _SoftSkillsPageState();
}

class _SoftSkillsPageState extends State<SoftSkillsPage> {
  final softSkillsCubit = getIt<SoftSkillsCubit>()..load();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Your Soft Skills',
        svgIconPath: Assets.assets_images_ico_skillsoft_svg,
        iconColor: CivColors.blue,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Read about your soft skills, get to know what you are naturally talented in and feel free to share them on your CV and in interviews. They are just as valuable as your work experience!'),
              BlocBuilder<SoftSkillsCubit, SoftSkillsState>(
                bloc: softSkillsCubit,
                builder: (context, state) {
                  return switch (state) {
                    SoftSkillsStateLoading() ||
                    SoftSkillsStateErrorLoading() =>
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: Spacing.s_16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    SoftSkillsStateSucess(
                      :final topSkills,
                      :final lowerSkills,
                      :final otherSkills,
                    ) =>
                      SkillSections(
                        topSkills: topSkills,
                        lowerSkills: lowerSkills,
                        otherSkills: otherSkills,
                      ),
                  };
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillSections extends StatelessWidget {
  const SkillSections({
    required this.topSkills,
    required this.lowerSkills,
    required this.otherSkills,
    super.key,
  });

  final List<Skill> topSkills;
  final List<Skill> lowerSkills;
  final List<Skill> otherSkills;

  @override
  Widget build(BuildContext context) {
    const spacing = 40.0;

    return Column(
      children: [
        const SizedBox(height: spacing),
        SkillSection(
          title: 'Your Top Skills',
          skills: topSkills,
          imagePath: switch (topSkills.first) {
            Skill.adaptability => Assets.assets_images_adaptability_skill_png,
            Skill.attentionToDetail =>
              Assets.assets_images_attention_to_detail_skill_png,
            Skill.communication => Assets.assets_images_communication_skill_png,
            Skill.creativity => Assets.assets_images_creativity_skill_png,
            Skill.interpersonal => Assets.assets_images_interpersonal_skill_png,
            Skill.leadership => Assets.assets_images_leadership_skill_png,
            Skill.problemSolving =>
              Assets.assets_images_problem_solving_skill_png,
            Skill.teamwork => Assets.assets_images_teamwork_skill_png,
            Skill.timeManagement =>
              Assets.assets_images_time_management_skill_png,
            Skill.workEthic => Assets.assets_images_work_ethic_skill_png,
          },
        ),
        const SizedBox(height: spacing),
        SkillSection(title: 'Some Areas You can Work on', skills: lowerSkills),
        const SizedBox(height: spacing),
        SkillSection(title: 'Some of Your Other Skills', skills: otherSkills),
        const SizedBox(height: spacing),
      ],
    );
  }
}

class SkillSection extends StatefulWidget {
  const SkillSection({
    required this.title,
    required this.skills,
    this.imagePath,
    super.key,
  });

  final String title;
  final List<Skill> skills;
  final String? imagePath;

  @override
  State<SkillSection> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  late final expandedSkills = widget.skills.map(_ExpandedItem.new).toList();

  @override
  Widget build(BuildContext context) {
    final dividerColor = Colors.black.withOpacity(0.2);
    bool isFirst(int index) => index == 0;
    bool isLast(int index) => index == expandedSkills.length - 1;
    const radius = 5.0;
    final titleToCardSpacing =
        Spacing.s_16 - (widget.imagePath == null ? 0 : radius);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CivText.titleMedium(widget.title),
        SizedBox(height: titleToCardSpacing),
        Shadowed(
          child: Column(
            children: [
              if (widget.imagePath != null)
                Transform.translate(
                  offset: const Offset(0, radius),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                    child: Image.asset(
                      widget.imagePath!,
                      height: 155,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Column(
                  children: [
                    for (int i = 0; i < expandedSkills.length; ++i)
                      ExpansionTile(
                        title: CivText.titleMedium(
                            expandedSkills[i].item.fullName),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        iconColor: CivColors.lightGrey,
                        collapsedIconColor: CivColors.lightGrey,
                        shape: Border(
                          top: BorderSide(
                            color:
                                isFirst(i) ? Colors.transparent : dividerColor,
                            width: isFirst(i) ? 0.0 : 0.5,
                          ),
                          bottom: BorderSide(
                            color:
                                isLast(i) ? Colors.transparent : dividerColor,
                            width: isLast(i) ? 0.0 : 0.5,
                          ),
                        ),
                        collapsedShape: Border(
                          top: BorderSide(
                            color:
                                isFirst(i) ? Colors.transparent : dividerColor,
                            width: isFirst(i) ? 0.0 : 0.5,
                          ),
                          bottom: BorderSide(
                            color:
                                isLast(i) ? Colors.transparent : dividerColor,
                            width: isLast(i) ? 0.0 : 0.5,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Spacing.s_16,
                                right: Spacing.s_16,
                                bottom: Spacing.s_16),
                            child: CivText.bodyMedium(
                                expandedSkills[i].item.description),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpandedItem<T> {
  _ExpandedItem(this.item);

  final T item;
  bool isExpanded = false;
}
