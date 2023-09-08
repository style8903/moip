import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moip/features/authentication/sign_up_screen.dart';
import 'package:moip/main_navigation_screen.dart';

import 'features/authentication/repos/authentication_repos.dart';

class Routes {
  static const signUpScreenName = "signUp";
  static const signUpScreenURL = "/";

  static const mainScreenName = "mainNavigation";

  //아래 네가지 중 하나만 허용하는 주소
  static const mainScreenURL = "/:tab(home|search|camera|profile)";
}

final routerProvider = Provider((ref) {
  //authState 변화를 감지하여 로그아웃 될 경우 새로고침 하여 보여지는 화면을 변경
  ref.watch(authState);
  return GoRouter(
    //시작 위치
    initialLocation: "/camera",
    //향 후 로그인 확인 후 시작화면 변경 적용
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      //로그인 되어 있지 않은 상태에서 signUp이나 login이 아닌 화면으로 가려고 한다면 signUp 스크린으로 다시 보낸다
      if(!isLoggedIn){
        if(state.subloc != Routes.signUpScreenURL){
          return Routes.signUpScreenURL;
        }
      }
      return null;
    },
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            //ref.read()
            return child;
          },
          routes: [
            GoRoute(
              path: Routes.signUpScreenURL,
              name: Routes.signUpScreenName,
              builder: (context, state) => const SignUpScreen(),
            ),
            GoRoute(
              path: Routes.mainScreenURL,
              name: Routes.mainScreenName,
              builder: (context, state) => const MainNavigationScreen(),
            )
          ])
    ],
  );
});
