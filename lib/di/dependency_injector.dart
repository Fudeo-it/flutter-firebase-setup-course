import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_app/cubits/dark_mode_cubit.dart';
import 'package:telegram_app/providers/shared_preferences_provider.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _providers(
        child: _blocs(
          child: child,
        ),
      );

  Widget _providers({required Widget child}) => MultiProvider(
        providers: [
          Provider<SharedPreferencesProvider>(
            create: (_) => SharedPreferencesProvider(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          )
        ],
        child: child,
      );

  Widget _mappers({required Widget child}) => MultiProvider(
        providers: [],
        child: child,
      );

  Widget _repositories({required Widget child}) => MultiRepositoryProvider(
        providers: [],
        child: child,
      );

  Widget _blocs({required Widget child}) => MultiBlocProvider(
        providers: [
          BlocProvider<DarkModeCubit>(
            create: (context) => DarkModeCubit(
              preferencesProvider: context.read(),
            )..init(),
          ),
        ],
        child: child,
      );
}
