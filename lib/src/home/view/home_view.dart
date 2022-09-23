import 'package:dmk_home/l10n/l10n.dart';
import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:dmk_home/src/home/models/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const primaryColor = Color(0xff94c614);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final screenWidth = MediaQuery.of(context).size.width;

    final navigationBarItems = <ImageWithName>[
      ImageWithName(label: l10n.navBarItem1, imageUrl: 'plan.png'),
      ImageWithName(label: l10n.navBarItem2, imageUrl: 'cook_now.png'),
      ImageWithName(label: l10n.navBarItem3, imageUrl: 'home.png'),
      ImageWithName(label: l10n.navBarItem4, imageUrl: 'learn.png'),
      ImageWithName(label: l10n.navBarItem5, imageUrl: 'shop.png'),
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
          BlocBuilder<MealBloc, MealState>(
            buildWhen: (previous, current) =>
                previous.popularRecipeStatus != current.popularRecipeStatus,
            builder: (context, state) {
              if (state.popularRecipeStatus == Status.success) {
                final list = state.popularRecipeList
                    .where((element) => element.isROTD == 1)
                    .toList();
                final recipeOfTheDay = list.isEmpty ? Meal.empty : list.first;
                return SizedBox(
                  height: screenWidth / 1.8,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (recipeOfTheDay.imageUrl.isNotEmpty)
                        Image.asset(
                          recipeOfTheDay.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white60,
                              Colors.white12,
                              Colors.transparent,
                              Colors.black12,
                              Colors.black38,
                              Colors.black54,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TitleText(
                              title: l10n.headerTitle,
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    recipeOfTheDay.name,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                      5,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: CustomIcon(
                                          imageUrl: 'star.png',
                                          iconSize: 12,
                                          iconColor: (index + 1 >
                                                  double.parse(
                                                    recipeOfTheDay.rating,
                                                  ))
                                              ? Colors.white
                                              : Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/chef.png'),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.secondaryHeaderTitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            l10n.secondaryHeaderSubtitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.only(
                          right: 16,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.popularRecepiesTitle,
            buttonLabel: l10n.popularRecepiesActionTitle,
          ),
          SizedBox(
            height: screenWidth / 2.4,
            child: BlocBuilder<MealBloc, MealState>(
              buildWhen: (previous, current) =>
                  previous.popularRecipeStatus != current.popularRecipeStatus,
              builder: (context, state) {
                if (state.popularRecipeStatus == Status.success) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.popularRecipeList.length,
                    itemBuilder: (context, index) => Center(
                      child: SizedBox(
                        width: screenWidth / 2.8,
                        height: screenWidth / 2.8,
                        child: Card(
                          margin: EdgeInsets.only(
                            left: 12,
                            right: index == (state.popularRecipeList.length - 1)
                                ? 12
                                : 0,
                          ),
                          elevation: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      state.popularRecipeList[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  state.popularRecipeList[index].name,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.suggestedMealTitle,
            buttonLabel: l10n.suggestedMealActionTitle,
          ),
          SizedBox(
            height: screenWidth / 1.8,
            child: BlocBuilder<MealBloc, MealState>(
              buildWhen: (previous, current) =>
                  previous.suggestedMealStatus != current.suggestedMealStatus,
              builder: (context, state) {
                if (state.suggestedMealStatus == Status.success) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.suggestedMealList.length,
                    itemBuilder: (context, index) {
                      final meal = state.suggestedMealList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 12,
                          right: index == (state.suggestedMealList.length - 1)
                              ? 12
                              : 0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              meal.day,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              child: Image.asset(
                                meal.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              meal.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const CustomDivider(),
          TitleButtonTile(
            label: l10n.suggestedContentsTitle,
            buttonLabel: l10n.suggestedContentsActionTitle,
          ),
          SizedBox(
            height: screenWidth / 1.8,
            child: BlocBuilder<MealBloc, MealState>(
              buildWhen: (previous, current) =>
                  previous.contentStatus != current.contentStatus,
              builder: (context, state) {
                if (state.contentStatus == Status.success) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.contentList.length,
                    itemBuilder: (context, index) {
                      final content = state.contentList[index];
                      return Center(
                        child: SizedBox(
                          width: screenWidth / 2.3,
                          height: screenWidth / 2,
                          child: Card(
                            elevation: 8,
                            margin: EdgeInsets.only(
                              left: 12,
                              top: 8,
                              bottom: 8,
                              right: index == (state.contentList.length - 1)
                                  ? 12
                                  : 0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                          content.imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                        if (content.isArticle == 0)
                                          const CustomIcon(
                                            imageUrl: 'play.png',
                                            iconColor: Colors.white,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        content.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          height: 1.2,
                                        ),
                                      ),
                                      if (content.isArticle == 1)
                                        Text(
                                          '${content.pages} pages',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        content.isArticle == 0
                                            ? 'Lesson 1'
                                            : 'Article',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
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

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 12,
      endIndent: 12,
    );
  }
}

class TitleButtonTile extends StatelessWidget {
  const TitleButtonTile({
    super.key,
    required this.label,
    required this.buttonLabel,
  });

  final String label;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ).copyWith(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TitleText(title: label),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: primaryColor,
              ),
            ),
            child: Text(
              buttonLabel,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ImageWithName {
  ImageWithName({
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;
}

final popularRecipesList = <ImageWithName>[
  ImageWithName(label: 'Taba ng talangka', imageUrl: 'recipe1.png'),
  ImageWithName(label: 'Pancit Palabok', imageUrl: 'recipe2.png'),
  ImageWithName(label: 'Bulalo', imageUrl: 'recipe3.png'),
  ImageWithName(label: 'Taba ng talangka', imageUrl: 'recipe1.png'),
];

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.imageUrl,
    this.iconColor,
    this.iconSize = 20,
  });

  final String imageUrl;
  final Color? iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(
        'assets/icons/$imageUrl',
      ),
      color: iconColor,
      size: iconSize,
    );
  }
}
