import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moip/constants/gaps.dart';
import 'package:moip/constants/text_style.dart';
import 'package:moip/features/authentication/view_models/social_auth_view_model.dart';
import '../../constants/sizes.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size40,
            horizontal: Sizes.size40,
          ),
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.v60,
                Text(
                  "Moip 시작하기",
                  style: myTextStyle.titleLargeBold.copyWith(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  ),
                ),
                Gaps.v60,
                Gaps.v60,
                GestureDetector(
                  onTap: () => ref.read(socialAuthProvider.notifier).googleSignIn(context),
                  child: Container(
                    color: Theme.of(context).colorScheme.background,
                    width:290,
                    height:50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 35,
                          child: Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit:BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text('Sign-in with Google', style: myTextStyle.buttonBold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
