import 'package:dmk_home/l10n/l10n.dart';
import 'package:dmk_home/src/home/models/nav_item.dart';
import 'package:dmk_home/src/home/view/widgets/custom_divider.dart';
import 'package:dmk_home/src/home/view/widgets/custom_icon.dart';
import 'package:dmk_home/src/home/view/widgets/find_recipe_card.dart';
import 'package:dmk_home/src/home/view/widgets/popular_recipes_list.dart';
import 'package:dmk_home/src/home/view/widgets/recipe_of_the_day_card.dart';
import 'package:dmk_home/src/home/view/widgets/suggested_content_list.dart';
import 'package:dmk_home/src/home/view/widgets/suggested_meal_list.dart';
import 'package:dmk_home/src/home/view/widgets/title_button_tile.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xff94c614);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final navigationBarItems = <NavItem>[
      NavItem(label: l10n.navBarItem1, imageUrl: 'plan.png'),
      NavItem(label: l10n.navBarItem2, imageUrl: 'cook_now.png'),
      NavItem(label: l10n.navBarItem3, imageUrl: 'home.png'),
      NavItem(label: l10n.navBarItem4, imageUrl: 'learn.png'),
      NavItem(label: l10n.navBarItem5, imageUrl: 'shop.png'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 32,
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CustomIcon(
            imageUrl: 'notifications.png',
            iconColor: Colors.black,
          ),
        ),
        title: Text(
          l10n.homeAppBarTitle,
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        actions: const [
          CustomIcon(
            imageUrl: 'search.png',
            iconColor: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomIcon(
              imageUrl: 'user.png',
              iconColor: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const RecipeOfTheDayCard(),
          const FindRecipeCard(),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.popularRecepiesTitle,
            buttonLabel: l10n.popularRecepiesActionTitle,
          ),
          const PopularRecipesList(),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.suggestedMealTitle,
            buttonLabel: l10n.suggestedMealActionTitle,
          ),
          const SuggestedMealList(),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.suggestedContentsTitle,
            buttonLabel: l10n.suggestedContentsActionTitle,
          ),
          const SuggestedContentList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        items: List.generate(
          navigationBarItems.length,
          (index) {
            final item = navigationBarItems[index];
            return BottomNavigationBarItem(
              label: item.label,
              icon: CustomIcon(
                imageUrl: item.imageUrl,
                iconSize: 26,
              ),
            );
          },
        ),
      ),
    );
  }
}
