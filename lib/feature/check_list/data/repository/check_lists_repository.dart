import 'dart:convert';

import 'package:async/async.dart';
import 'package:meta/meta.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/feature/check_list/check_list.dart';

final class CheckListsRepository {
  CheckListsRepository({required this.localStorageDataSource});

  @visibleForTesting
  final LocalStorageDataSource localStorageDataSource;

  @visibleForTesting
  final checkListsMemo = AsyncMemoizer<Map<String, List<CheckListItem>>>();

  @visibleForTesting
  Future<Map<String, List<CheckListItem>>> get checkLists async =>
      checkListsMemo.runOnce(loadAll);

  @visibleForTesting
  Future<Map<String, List<CheckListItem>>> loadAll() async {
    final checkListDataString =
        await localStorageDataSource.read(StorageKey.checklist);
    if (checkListDataString == null || checkListDataString.isEmpty) {
      return <String, List<CheckListItem>>{};
    }

    final jsonMap = jsonDecode(checkListDataString) as Map<String, dynamic>;
    return jsonMap.map((key, jsonList) {
      return MapEntry(
        key,
        (jsonList as List<dynamic>).map((jsonItem) {
          return CheckListItem.fromJson(jsonItem as Map<String, Object?>);
        }).toList(),
      );
    });
  }

  @protected
  Future<void> saveCheckList(List<CheckListItem> checkList, String id) async {
    final checkLists = await this.checkLists;
    checkLists[id] = checkList;
    final jsonCheckListString = jsonEncode(checkLists);
    await localStorageDataSource.write(
        key: StorageKey.checklist, value: jsonCheckListString,);
  }

  @protected
  Future<List<CheckListItem>?> loadById(String id) async =>
      (await checkLists)[id];
}

abstract class CheckListRepository {
  CheckListRepository({required this.checkListsRepository});

  String get checkListId;

  List<CheckListItem> get checkList;

  @visibleForTesting
  final CheckListsRepository checkListsRepository;

  Future<List<CheckListItem>?> load() async =>
      checkListsRepository.loadById(checkListId);

  Future<void> save(List<CheckListItem> checkList) async =>
      checkListsRepository.saveCheckList(checkList, checkListId);

  Future<void> init() async {
    final storedCheckList = await checkListsRepository.loadById(checkListId);

    if (storedCheckList == null || storedCheckList.isEmpty) {
      await checkListsRepository.saveCheckList(checkList, checkListId);
    }
  }
}
