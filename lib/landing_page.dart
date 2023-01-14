import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/auth/presentation/providers/user_provider.dart';
import 'routes/routes.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userProvider, (previous, next) {
      Navigator.of(context).pushReplacementNamed(next.user.fold(() => Routes.splash, (a) => Routes.home));
    });

    return const ColoredBox(color: Colors.white);
  }
}
