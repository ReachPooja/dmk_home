import 'package:dmk_home/l10n/l10n.dart';
import 'package:dmk_home/src/home/view/home_view.dart';
import 'package:flutter/material.dart';

class FindRecipeCard extends StatelessWidget {
  const FindRecipeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
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
    );
  }
}
