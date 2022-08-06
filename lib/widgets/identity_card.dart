import 'package:flutter/material.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class IdentityCard extends StatelessWidget {
  IdentityCard({
    required this.title,
    required this.number,
    required this.body,
    this.borderRadius = Sizes.RADIUS_8,
    this.recommendedText = "Recommended",
    this.hasRecommended = false,
    this.recommendedColor = AppColors.red,
    this.numberColor = AppColors.green,
    this.elevation = Sizes.ELEVATION_4,
  });

  final double borderRadius;
  final double elevation;
  final String title;
  final String body;
  final int number;
  final String recommendedText;
  final Color numberColor;
  final Color recommendedColor;
  final bool hasRecommended;

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_16, vertical: Sizes.MARGIN_16),
        child: Column(

          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: Sizes.WIDTH_30,
                  height: Sizes.HEIGHT_30,
                  decoration: BoxDecoration(
                    color: numberColor,
                    borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: textTheme.titleMedium?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
                SpaceW16(),
                Container(
                  margin: EdgeInsets.only(top: Sizes.MARGIN_8),
                  child: Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(color: AppColors.black),
                  ),
                ),
                Spacer(flex: 1),
                hasRecommended
                    ? Container(
                        height: Sizes.HEIGHT_20,
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizes.MARGIN_8),
                        decoration: BoxDecoration(
                          color: recommendedColor,
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
                        ),
                        child: Center(
                          child: Text(
                            recommendedText,
                            style: textTheme.titleSmall?.copyWith(
                                color: AppColors.white,
                                fontSize: Sizes.TEXT_SIZE_10),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SpaceH8(),
            Container(
              margin: const EdgeInsets.only(left: Sizes.MARGIN_46),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      body,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
