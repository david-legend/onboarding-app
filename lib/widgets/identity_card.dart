import 'package:flutter/material.dart';
import 'package:onboardingapp/values/values.dart';
import 'package:onboardingapp/widgets/spaces.dart';

class IdentityCard extends StatelessWidget {
  IdentityCard({
    @required this.title,
    this.borderRadius = Sizes.RADIUS_8,
    this.body,
    this.number,
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
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(

          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: numberColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: textTheme.title.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
                SpaceW16(),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    title,
                    style: textTheme.title.copyWith(color: AppColors.black),
                  ),
                ),
//                Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//
//                    ],
//                  ),
//                ),
                Spacer(flex: 1),
                hasRecommended
                    ? Container(
                        height: 20,
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizes.MARGIN_8),
                        decoration: BoxDecoration(
                          color: recommendedColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            recommendedText,
                            style: textTheme.subtitle.copyWith(
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
              margin: const EdgeInsets.only(left: 46),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      body,
                      style: textTheme.body1,
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
