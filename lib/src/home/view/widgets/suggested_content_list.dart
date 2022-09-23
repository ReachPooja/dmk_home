import 'package:dmk_home/src/home/bloc/meal_bloc.dart';
import 'package:dmk_home/src/home/view/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedContentList extends StatelessWidget {
  const SuggestedContentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
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
                        right: index == (state.contentList.length - 1) ? 12 : 0,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
