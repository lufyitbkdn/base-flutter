import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/feature/check_list/check_list.dart';
import 'package:my_wo/feature/favourites/favorites.dart';
import 'package:my_wo/feature/home/home.dart';
import 'package:my_wo/feature/skills/skills.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';
import 'package:my_wo/firebase/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class ProductionServiceLocator {
  @mustCallSuper
  Future<void> setup() async {
    const packageName = 'com.mywo';
    getIt
      ..registerSingleton(FirebaseAnalytics.instance)
      ..registerSingleton(
        FirebaseAnalyticsScreenViewSender(firebaseAnalytics: getIt()),
      )
      ..registerSingleton(UrlLauncher())
      ..registerSingleton(
        const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
            sharedPreferencesName: 'ring.mp3',
            preferencesKeyPrefix: packageName,
          ),
          iOptions: IOSOptions(
            accountName: packageName,
            accessibility: KeychainAccessibility.first_unlock_this_device,
          ),
        ),
      );

    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton(sharedPreferences);

    final localStorageDataSource = LocalStorageDataSource(
      secureStorage: getIt(),
      sharedPreferences: getIt(),
    );
    await localStorageDataSource.init();
    getIt.registerSingleton(localStorageDataSource);

    final checkListsRepository =
        CheckListsRepository(localStorageDataSource: getIt());
    getIt.registerSingleton(checkListsRepository);

    final afterInterviewCheckListRepository =
        AfterInterviewCheckListRepository(checkListsRepository: getIt());
    await afterInterviewCheckListRepository.init();
    getIt.registerSingleton(afterInterviewCheckListRepository);

    final beforeInterviewCheckListRepository =
        BeforeInterviewCheckListRepository(checkListsRepository: getIt());
    await beforeInterviewCheckListRepository.init();

    getIt
      ..registerSingleton(beforeInterviewCheckListRepository)
      ..registerSingleton(SkillsRepository(localStorageDataSource: getIt()))
      ..registerFactory(
        () => HasCompletedSkillsQuizUseCase(skillsRepository: getIt()),
      )
      ..registerFactory(
        () => MySkillsCubit(hasCompletedSkillsQuizUseCase: getIt()),
      )
      ..registerFactory(
        () => SkillsQuizCubit(
          hasCompletedSkillsQuizUseCase: getIt(),
          skillsRepository: getIt(),
        ),
      )
      ..registerFactory(
        () => SortSkillQuizResultsUseCase(skillsRepository: getIt()),
      )
      ..registerFactory(
        () => SoftSkillsCubit(sortSkillQuizResultsUseCase: getIt()),
      )
      ..registerFactory(() => HardSkillsCubit(skillsRepository: getIt()))
      ..registerSingleton(FavouritesRepository(localStorageDataSource: getIt()))
      ..registerFactory(() => MyFavouritesCubit(favouritesRepository: getIt()))
      ..registerFactory(
        () => IsFavouritedUseCase(favouritesRepository: getIt()),
      )
      ..registerFactory(() => HomeRepository(localStorageDataSource: getIt()))
      ..registerFactory(
        () => InterviewAfterCubit(afterInterviewCheckListRepository: getIt()),
      )
      ..registerFactory(
        () => InterviewBeforeCubit(beforeInterviewCheckListRepository: getIt()),
      );
  }
}

class StagingServiceLocator extends ProductionServiceLocator {
  @override
  Future<void> setup() async {
    await super.setup();

    getIt
      ..unregister<FirebaseAnalyticsScreenViewSender>()
      ..registerSingleton<FirebaseAnalyticsScreenViewSender>(
        NoOpFirebaseAnalyticsScreenViewSender(firebaseAnalytics: getIt()),
      );
  }
}

class DevelopmentServiceLocator extends ProductionServiceLocator {
  @override
  Future<void> setup() async {
    await super.setup();

    getIt
      ..unregister<FirebaseAnalyticsScreenViewSender>()
      ..registerSingleton<FirebaseAnalyticsScreenViewSender>(
        NoOpFirebaseAnalyticsScreenViewSender(firebaseAnalytics: getIt()),
      );
  }
}
