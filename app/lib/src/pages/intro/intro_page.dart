part of 'intro_controller.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget().setCanBack(true).build(context);
  }

  Widget _body(BuildContext context) {
    final PageController pageController = PageController();

    final pages = [
      IntroView(
        image: R.pngs.intro1.image(),
        title: R.strings.introTitle1,
        subTitle: R.strings.introSubTitle1,
      ),
      IntroView(
        image: R.pngs.intro2.image(),
        title: R.strings.introTitle2,
        subTitle: R.strings.introSubTitle2,
      ),
      IntroView(
        image: R.pngs.intro3.image(),
        title: R.strings.introTitle3,
        subTitle: R.strings.introSubTitle3,
      ),
      IntroView(
        image: R.pngs.intro4.image(),
        title: R.strings.introTitle4,
        subTitle: R.strings.introSubTitle4,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorPaddingScale(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: pages,
            ),
          ),
          SizedBox(
            height: AppThemeExt.of.majorPaddingScale(8),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            effect: ExpandingDotsEffect(
              dotHeight: AppThemeExt.of.majorScale(2),
              dotWidth: AppThemeExt.of.majorScale(2),
              dotColor: AppColors.of.grayColor[200]!,
              activeDotColor: AppColors.of.grayColor[800]!,
            ),
          ),
          SizedBox(
            height: AppThemeExt.of.majorPaddingScale(6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextButtonWidget()
                  .setButtonText(R.strings.skip)
                  .setOnPressed(() {
                // TODO: Go to welcome page
              }).build(context),
              InkWell(
                onTap: () {
                  // TODO: Go to next page
                },
                child: CircleAvatar(
                  radius: AppThemeExt.of.majorScale(5),
                  backgroundColor: AppColors.of.redColor[500]!,
                  child: R.svgs.icArrowRight.svg(
                    width: AppThemeExt.of.majorScale(4),
                    height: AppThemeExt.of.majorScale(4),
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppThemeExt.of.majorPaddingScale(2),
          ),
        ],
      ),
    );
  }
}
