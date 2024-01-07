import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';
import 'package:rick_and_morty/infrastructure/datasources/api_fetch_datasource_impl.dart';
import 'package:rick_and_morty/infrastructure/repositories/character_respository_impl.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';

import 'package:rick_and_morty/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterRepositoryImpl characterRepository =
        CharacterRepositoryImpl(characterDataSource: ApiFetchDataSourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                DiscoverProvider(characterRepository: characterRepository)
                  ..getCharacters()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Morty',
          theme: AppTheme().theme(),
          home: const HomeScreen()),
    );
  }
}
