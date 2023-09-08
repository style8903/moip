import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moip/features/authentication/repos/authentication_repos.dart';
import '../../../router.dart';
import '../../../utils.dart';

class SocialAuthViewModel extends AsyncNotifier<void>{
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> googleSignIn(BuildContext context) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async=> await _repository.googleSignIn());
    if(state.hasError){
      if (state.hasError) {
        showFirebaseErrorSnack(context, state.error);
      }
    } else{
      //회원가입 완료 시 onBording 화면(안내화면)으로 이동
      context.go("/camera");
    }
  }

}

final socialAuthProvider = AsyncNotifierProvider<SocialAuthViewModel, void>(() => SocialAuthViewModel(),);