import 'package:flutter/material.dart';

const primaryColor = Color(0xff94c614);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        title: const Text(
          'Kitchenomics',
          style: TextStyle(
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
          SizedBox(
            height: screenWidth / 1.8,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/recipe.png',
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
                      const TitleText(
                        title: 'Recipe of the day',
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Mixed Vegas Baked',
                              style: TextStyle(
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
                                    iconColor: (index == 3 || index == 4)
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
                        children: const [
                          Text(
                            'Find the recipes\nbased on what',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            'YOU HAVE AT HOME',
                            style: TextStyle(
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
          const TitleButtonTile(
            label: 'Popular Recipes',
            buttonLabel: 'All Recipes',
          ),
          SizedBox(
            height: screenWidth / 2.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Center(
                child: SizedBox(
                  width: screenWidth / 2.8,
                  height: screenWidth / 2.8,
                  child: Card(
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
                                'assets/images/${popularRecipesList[index].imageUrl}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            popularRecipesList[index].label,
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
            ),
          ),
          const CustomDivider(),
          const TitleButtonTile(
            label: 'Suggested Meal Plan',
            buttonLabel: 'Meal Planner',
          ),
          SizedBox(
            height: screenWidth / 1.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    const Text(
                      'Monday',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Image.asset(
                        'assets/images/meal1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bangus Sardines',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const CustomDivider(),
          const TitleButtonTile(
            label: 'Suggested Contents',
            buttonLabel: 'View All',
          ),
          SizedBox(
            height: screenWidth / 1.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Center(
                child: SizedBox(
                  width: screenWidth / 2.3,
                  height: screenWidth / 2,
                  child: Card(
                    elevation: 8,
                    margin: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      bottom: 8,
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
                                  'assets/images/content1.png',
                                  fit: BoxFit.cover,
                                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'How to make a better kitchen',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Lesson 1',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          TitleText(title: label),
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

final navigationBarItems = <ImageWithName>[
  ImageWithName(label: 'Plan', imageUrl: 'plan.png'),
  ImageWithName(label: 'Cook Now', imageUrl: 'cook_now.png'),
  ImageWithName(label: 'Home', imageUrl: 'home.png'),
  ImageWithName(label: 'Learn', imageUrl: 'learn.png'),
  ImageWithName(label: 'Shop', imageUrl: 'shop.png'),
];

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
