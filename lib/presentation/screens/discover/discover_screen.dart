import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/widgets/shared/card_character.dart';

import '../../widgets/shared/custom_textfield.dart';

class DiscoverScreen extends StatelessWidget {
  static const String title = 'Discover';
  static const IconData icon = Icons.explore;
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [_SearchView(), _DiscoverView(), SizedBox(height: 30)],
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final discoverProvider = Provider.of<DiscoverProvider>(context);

    return SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 16),
            child: Column(
              children: [
                const Text(
                  'Find your favorite character',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                    onSubmitted: (value) =>
                        discoverProvider.getCharactersByParams({
                          'name': value,
                        })),
              ],
            ),
          ),
        ));
  }
}

class _DiscoverView extends StatelessWidget {
  const _DiscoverView();

  @override
  Widget build(BuildContext context) {
    final discoverProvider = Provider.of<DiscoverProvider>(context);

    if (discoverProvider.isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    return Expanded(
        child: GridView.builder(
      itemCount: discoverProvider.listCharacters.length,
      controller: discoverProvider.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.5, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        Character character = discoverProvider.listCharacters[index];
        return CardCharacter(character: character);
      },
    ));
  }
}
