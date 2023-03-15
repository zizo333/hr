import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/helpers/helper_functions.dart';

import '../../../../config/themes/app_colors.dart';

class DayTimer extends StatefulWidget {
  final DateTime date;

  const DayTimer(this.date, {super.key});

  @override
  State<DayTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<DayTimer> {
  String _time = '00:00:00';

  Timer? _timer;

  @override
  void didChangeDependencies() {
    _startTimer();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: TextStyle(
        fontSize: 60.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  void _startTimer() {
    int seconds = DateTime.now().difference(widget.date).inSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds++;
      setState(() {
        _time = HelperFunctions.convertSecondsToHMS(seconds);
      });
    });
  }
}
