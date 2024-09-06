import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:adhoc/src/core/utils/app_assets.dart';

class SliverRefreshControlWidget extends StatelessWidget {
  const SliverRefreshControlWidget({
    super.key,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      refreshTriggerPullDistance: 130,
      builder: (
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
      ) {
        return Lottie.asset(
          AppAssets.shoppingLoader,
          repeat: true,
        );
      },
      onRefresh: onRefresh,
    );
  }
}
