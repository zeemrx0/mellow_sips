part of './app_list_view_controller.dart';

class AppListViewWidget<BM extends BaseModel,
    BC extends AppListViewController<BM>> extends GetWidget<BC> {
  AppListViewWidget({
    required this.childBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.scrollController,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.emptyView,
    this.retryView,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext, BM model, int index) childBuilder;
  final Widget? emptyView;
  final Widget? retryView;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? scrollController;
  final ScrollPhysics physics;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        controller: _refreshController,
        onRefresh: () => _onRefresh(controller),
        onLoading: () => _onLoadMore(controller),
        child: controller.appException.value != null
            ? _retry(context, controller)
            : _main(context),
      ),
    );
  }

  Widget _main(BuildContext context) {
    final List<BM> data = controller.data;

    return data.isEmpty
        ? emptyView ??
            Center(
              child: AppTextHeading3Widget()
                  .setText(R.strings.empty)
                  .setTextAlign(TextAlign.center)
                  .build(context),
            )
        : ListView.builder(
            controller: scrollController,
            scrollDirection: scrollDirection,
            reverse: reverse,
            physics: physics,
            itemCount: data.length,
            itemBuilder: (ctx, index) => childBuilder.call(
              ctx,
              controller.data[index],
              index,
            ),
          );
  }

  Widget _retry(BuildContext context, AppListViewController<BM> controller) {
    return retryView ??
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorPaddingScale(4)),
              child: AppTextHeading3Widget()
                  .setText(R.strings.systemIsCurrentlyErrorPleaseTryAgainLater)
                  .setTextAlign(TextAlign.center)
                  .build(context),
            ),
            AppFilledButtonWidget()
                .setButtonText(R.strings.retry)
                .setOnPressed(() => controller.initFetch())
                .build(context),
          ],
        );
  }

  void _onRefresh(AppListViewController<BM> controller) async {
    await controller.onRefreshCall();
    // Always allow pull to refresh
    _refreshController.refreshToIdle();
  }

  void _onLoadMore(AppListViewController<BM> controller) async {
    if (!controller.hasMore.value) {
      return _refreshController.loadComplete();
    }
    Logs.i('Load more');
    await controller.onLoadMoreCall();
    _refreshController.loadComplete();
  }
}
