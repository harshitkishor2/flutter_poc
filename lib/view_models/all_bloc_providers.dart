import 'package:flutter/material.dart';
import 'package:flutter_poc/di/service_locator.dart';

import 'blocs.dart';

class AllBlocProviders extends StatelessWidget {
  final Widget child;

  const AllBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
            create: (context) => di<AppSettingsBloc>()),
        BlocProvider<AuthenticationBloc>(
            create: (context) => di<AuthenticationBloc>()),
      ],
      child: child,
    );
  }
}
