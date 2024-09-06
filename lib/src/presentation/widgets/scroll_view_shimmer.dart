import 'package:shimmer/shimmer.dart';

import '../../../exports_main.dart';
import 'app_space_widget.dart';

class ScrollViewShimmer extends StatelessWidget {
  const ScrollViewShimmer({super.key, this.itemCount = 2, this.height = 300});
  final int? itemCount;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList.separated(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: AppColors.shimmerBase,
                highlightColor: AppColors.shimmerHighlight,
                child: Container(
                  height: height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return setHeight(16);
            },
          ),
        ),
      ],
    );
  }
}
