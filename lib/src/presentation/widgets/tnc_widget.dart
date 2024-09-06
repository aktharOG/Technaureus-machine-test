import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:adhoc/exports_main.dart';

class TnCWidget extends StatelessWidget {
  const TnCWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'by_terms_conditions',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textGrey,
            ),
        children: [
          TextSpan(
            text: 'terms_conditions',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log('Terms of Conditions');
                navigator?.pushNamed(RouteName.tnc, arguments: true);
              },
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.linkColor,
                  color: AppColors.linkColor,
                ),
          ),
        ],
      ),
    );
  }
}
