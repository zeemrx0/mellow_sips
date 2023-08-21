part of '../intro_controller.dart';

class IntroView extends StatelessWidget {
  final Image image;
  final String title;
  final String subTitle;

  const IntroView({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        image,
        SizedBox(
          height: AppThemeExt.of.majorPaddingScale(4),
        ),
        AppTextHeading4Widget()
            .setText(title)
            .setTextAlign(TextAlign.center)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorPaddingScale(1),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: AppThemeExt.of.majorScale(60),
          ),
          child: AppTextBody1Widget()
              .setText(subTitle)
              .setTextAlign(TextAlign.center)
              .build(context),
        ),
      ],
    );
  }
}
