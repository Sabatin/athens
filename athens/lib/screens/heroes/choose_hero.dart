import 'package:athens/model/hero.dart';
import 'package:athens/screens/heroes/hero_card.dart';
import 'package:flutter/material.dart';

class ChooseHero extends StatelessWidget {
  const ChooseHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                Text("Choose your hero", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    children: [
                      HeroCard(FoodHero('Pizza', 'description')),
                      SizedBox(height: 16),
                      HeroCard(FoodHero('Kebab', 'description')),
                      SizedBox(height: 16),
                      HeroCard(FoodHero('Pita', 'description')),
                      SizedBox(height: 16),
                      HeroCard(FoodHero('Pizza', 'description')),
                      SizedBox(height: 16),
                      HeroCard(FoodHero('Fruit', 'description'))
                    ],
                  )
                )
              ],
            )
          ),
        )
      ),
    );
  }
}
