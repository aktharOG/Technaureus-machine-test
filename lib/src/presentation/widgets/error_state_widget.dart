import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/core/utils/app_assets.dart';
import 'package:adhoc/src/presentation/widgets/app_space_widget.dart';
import 'package:lottie/lottie.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.failure, this.onRetry});
  final Failure? failure;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    if (failure is NetworkFailure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.noInternet,
              width: 200,
              height: 200,
              repeat: true,
            ),
            Text(
              'no_internet_connection',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            setHeight(16),
            OutlinedButton(
              onPressed: onRetry,
              child: const Text('retry'),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.errorState,
              width: 200,
              height: 200,
              repeat: true,
            ),
            Text(
              'sorry_something_went_wrong}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            setHeight(8),
            Text(
              '${failure?.statusCode ?? 'Not Found'}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            setHeight(16),
            OutlinedButton(
              onPressed: failure?.statusCode == 401
                  ? () {
                      // context.read<ProfileProvider>().logout();
                    }
                  : onRetry,
              child: Text(
                failure?.statusCode == 401 ? 'logout}' : 'retry}',
              ),
            ),
          ],
        ),
      );
    }
  }
}
