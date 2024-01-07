import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:shimmer/shimmer.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(character.image,
              fit: BoxFit.cover, width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return SizedBox(
              child: Shimmer.fromColors(
                direction: ShimmerDirection.ltr,
                baseColor: Colors.grey,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  width: 200.0,
                  height: 100.0,
                  color: Colors.white,
                ),
              ),
            );
          }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromRGBO(63, 160, 151, 0.7),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(children: [
                  Text(character.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(character.status,
                      style: const TextStyle(color: Colors.white)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
