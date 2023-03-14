import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SubmitLoading extends StatelessWidget {
  final double size;

  const SubmitLoading({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.w,
        child: const LoadingIndicator(
          indicatorType: Indicator.orbit,
          colors: [Colors.white],
        ),
      ),
    );
  }
}

class FetchLoading extends StatelessWidget {
  final double size;

  const FetchLoading({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.w,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).primaryColor
          ],
        ),
      ),
    );
  }
}

class InlineLoading extends StatelessWidget {
  final Color? color;
  final double size;
  const InlineLoading({
    super.key,
    this.color,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.w,
        height: size.w,
        child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [
            color ?? Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  final Color? color;

  const ImageLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: SizedBox(
          width: 60.w,
          height: 60.w,
          child: LoadingIndicator(
            indicatorType: Indicator.ballScale,
            colors: [
              color ?? Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
      ),
    );
  }
}
