// Mocks generated by Mockito 5.4.2 from annotations
// in civstart/test/skills/domain/skills_use_cases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:civstart/app/app.dart' as _i2;
import 'package:civstart/skills/skills.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocalStorageDataSource_0 extends _i1.SmartFake
    implements _i2.LocalStorageDataSource {
  _FakeLocalStorageDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SkillsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSkillsRepository extends _i1.Mock implements _i3.SkillsRepository {
  @override
  _i2.LocalStorageDataSource get localStorageDataSource => (super.noSuchMethod(
        Invocation.getter(#localStorageDataSource),
        returnValue: _FakeLocalStorageDataSource_0(
          this,
          Invocation.getter(#localStorageDataSource),
        ),
        returnValueForMissingStub: _FakeLocalStorageDataSource_0(
          this,
          Invocation.getter(#localStorageDataSource),
        ),
      ) as _i2.LocalStorageDataSource);
  @override
  List<_i3.SkillQuestion> get skillQuestions => (super.noSuchMethod(
        Invocation.getter(#skillQuestions),
        returnValue: <_i3.SkillQuestion>[],
        returnValueForMissingStub: <_i3.SkillQuestion>[],
      ) as List<_i3.SkillQuestion>);
  @override
  List<_i3.RankedHardSkill> get rankedHardSkills => (super.noSuchMethod(
        Invocation.getter(#rankedHardSkills),
        returnValue: <_i3.RankedHardSkill>[],
        returnValueForMissingStub: <_i3.RankedHardSkill>[],
      ) as List<_i3.RankedHardSkill>);
  @override
  _i4.Future<List<_i3.ScoredSkillQuestion>?> loadSoftSkillsQuizResult() =>
      (super.noSuchMethod(
        Invocation.method(
          #loadSoftSkillsQuizResult,
          [],
        ),
        returnValue: _i4.Future<List<_i3.ScoredSkillQuestion>?>.value(),
        returnValueForMissingStub:
            _i4.Future<List<_i3.ScoredSkillQuestion>?>.value(),
      ) as _i4.Future<List<_i3.ScoredSkillQuestion>?>);
  @override
  _i4.Future<void> saveSoftSkillsQuizResult(
          List<_i3.ScoredSkillQuestion>? scoredQuestionsData) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSoftSkillsQuizResult,
          [scoredQuestionsData],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveRankedHardSkill(_i3.RankedHardSkill? rankedHardSkill) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveRankedHardSkill,
          [rankedHardSkill],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i3.RankedHardSkill?> loadRankedHardSkill() => (super.noSuchMethod(
        Invocation.method(
          #loadRankedHardSkill,
          [],
        ),
        returnValue: _i4.Future<_i3.RankedHardSkill?>.value(),
        returnValueForMissingStub: _i4.Future<_i3.RankedHardSkill?>.value(),
      ) as _i4.Future<_i3.RankedHardSkill?>);
  @override
  _i4.Future<void> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
