import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/data/repositories/user_repository.dart';
import 'package:hr/presentation/screens/login/login_screen.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/app_strings.dart';
import '../../cubit/login/login_cubit.dart';
import '../../cubit/splash/splash_cubit.dart';
import '../../data/repositories/auth_repository.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import 'app_page_route.dart';
import 'app_routes.dart';

part 'routes_generator.dart';
