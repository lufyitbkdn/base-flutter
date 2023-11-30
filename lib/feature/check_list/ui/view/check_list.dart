import 'package:civstart/app/app.dart';
import 'package:civstart/feature/check_list/check_list.dart';
import 'package:civstart/feature/check_list/ui/cubit/check_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

typedef IndexedValueChanged<T> = void Function(T value, int index);

class ResetableCheckList extends StatefulWidget {
  const ResetableCheckList({
    required this.bloc,
    super.key,
  });

  final CheckListCubit bloc;

  @override
  State<ResetableCheckList> createState() => _ResetableCheckListState();
}

class _ResetableCheckListState extends State<ResetableCheckList> {
  @override
  void initState() {
    super.initState();
    widget.bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: PaddedContent(
            children: [
              TextButton(
                onPressed: widget.bloc.resetAll,
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
        BlocBuilder<CheckListCubit, CheckListState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return switch (state) {
              CheckListStateLoaded(:final checkList) => CheckList(
                  checkList: checkList,
                  indexedValueChanged: (value, index) => widget.bloc
                      .changeIsCheckedForIndex(index: index, isChecked: value),
                ),
              _ => const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            };
          },
        ),
      ],
    );
  }
}

class CheckList extends StatelessWidget {
  const CheckList({
    required this.checkList,
    required this.indexedValueChanged,
    super.key,
  });

  final List<CheckListItem> checkList;
  final IndexedValueChanged<bool> indexedValueChanged;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: checkList.length,
      itemBuilder: (context, index) {
        final checkListItem = checkList[index];
        return CheckListTile(
          title: checkListItem.title,
          subtitle: checkListItem.subtitle,
          value: checkListItem.isChecked,
          onChanged: (value) => indexedValueChanged(value ?? false, index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: kContentPaddingSpacing,
          endIndent: kContentPaddingSpacing,
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        );
      },
    );
  }
}

class CheckListTile extends StatelessWidget {
  const CheckListTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool?> onChanged;

  MaterialStateBorderSide? getSide(BuildContext context) {
    return MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
      final colorScheme = Theme.of(context).colorScheme;
      if (states.contains(MaterialState.disabled)) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(width: 2.0, color: Colors.transparent);
        }
        return BorderSide(
            width: 2.0, color: colorScheme.primary.withOpacity(0.38));
      }
      if (states.contains(MaterialState.selected)) {
        return const BorderSide(width: 0.0, color: Colors.transparent);
      }
      if (states.contains(MaterialState.error)) {
        return BorderSide(width: 2.0, color: colorScheme.error);
      }

      return BorderSide(width: 2.0, color: colorScheme.primary);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
        side: getSide(context),
      ),
      title: CivText.bodyMedium(title),
      subtitle: subtitle != null ? CivText.labelMedium(subtitle!) : null,
    );
  }
}
