import 'package:si_jaja/src/services/checklist_service.dart';
import 'package:si_jaja/src/services/user_service.dart';
import 'package:si_jaja/src/ui/views/checklist/checklist_create_view.dart';
import 'package:si_jaja/src/ui/views/login/login_view.dart';
import 'package:si_jaja/src/ui/views/main/main_view.dart';
import 'package:si_jaja/src/ui/views/regis/regis_view.dart';
import 'package:si_jaja/src/ui/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ChecklistCreateView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: ChecklistService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
