import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => Onboarding1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => Onboarding1Widget(),
        ),
        FFRoute(
          name: Onboarding1Widget.routeName,
          path: Onboarding1Widget.routePath,
          builder: (context, params) => Onboarding1Widget(),
        ),
        FFRoute(
          name: Onboarding2Widget.routeName,
          path: Onboarding2Widget.routePath,
          builder: (context, params) => Onboarding2Widget(),
        ),
        FFRoute(
          name: Onboarding3Widget.routeName,
          path: Onboarding3Widget.routePath,
          builder: (context, params) => Onboarding3Widget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: RegisterPageWidget.routeName,
          path: RegisterPageWidget.routePath,
          builder: (context, params) => RegisterPageWidget(),
        ),
        FFRoute(
          name: ForgetPasswordWidget.routeName,
          path: ForgetPasswordWidget.routePath,
          builder: (context, params) => ForgetPasswordWidget(),
        ),
        FFRoute(
          name: OTPFildPageWidget.routeName,
          path: OTPFildPageWidget.routePath,
          builder: (context, params) => OTPFildPageWidget(),
        ),
        FFRoute(
          name: ResetPassword12Widget.routeName,
          path: ResetPassword12Widget.routePath,
          builder: (context, params) => ResetPassword12Widget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: NotificationPageWidget.routeName,
          path: NotificationPageWidget.routePath,
          builder: (context, params) => NotificationPageWidget(),
        ),
        FFRoute(
          name: OutletDetailsPageWidget.routeName,
          path: OutletDetailsPageWidget.routePath,
          builder: (context, params) => OutletDetailsPageWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['outlets'],
            ),
          ),
        ),
        FFRoute(
          name: PaymentAndAddressWidget.routeName,
          path: PaymentAndAddressWidget.routePath,
          builder: (context, params) => PaymentAndAddressWidget(),
        ),
        FFRoute(
          name: ChatListPageWidget.routeName,
          path: ChatListPageWidget.routePath,
          builder: (context, params) => ChatListPageWidget(),
        ),
        FFRoute(
          name: ChatPageWidget.routeName,
          path: ChatPageWidget.routePath,
          builder: (context, params) => ChatPageWidget(),
        ),
        FFRoute(
          name: CallPageWidget.routeName,
          path: CallPageWidget.routePath,
          builder: (context, params) => CallPageWidget(),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: MapViewPageWidget.routeName,
          path: MapViewPageWidget.routePath,
          builder: (context, params) => MapViewPageWidget(),
        ),
        FFRoute(
          name: MyCartPageWidget.routeName,
          path: MyCartPageWidget.routePath,
          builder: (context, params) => MyCartPageWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: PersonalDetailWidget.routeName,
          path: PersonalDetailWidget.routePath,
          builder: (context, params) => PersonalDetailWidget(),
        ),
        FFRoute(
          name: SettingPageWidget.routeName,
          path: SettingPageWidget.routePath,
          builder: (context, params) => SettingPageWidget(),
        ),
        FFRoute(
          name: HelpCenterPageWidget.routeName,
          path: HelpCenterPageWidget.routePath,
          builder: (context, params) => HelpCenterPageWidget(),
        ),
        FFRoute(
          name: ExtraCardPageWidget.routeName,
          path: ExtraCardPageWidget.routePath,
          builder: (context, params) => ExtraCardPageWidget(),
        ),
        FFRoute(
          name: AddCardv2PageWidget.routeName,
          path: AddCardv2PageWidget.routePath,
          builder: (context, params) => AddCardv2PageWidget(),
        ),
        FFRoute(
          name: DaftarOutletWidget.routeName,
          path: DaftarOutletWidget.routePath,
          builder: (context, params) => DaftarOutletWidget(),
        ),
        FFRoute(
          name: CobaoutletpageWidget.routeName,
          path: CobaoutletpageWidget.routePath,
          builder: (context, params) => CobaoutletpageWidget(),
        ),
        FFRoute(
          name: AdminHomePageWidget.routeName,
          path: AdminHomePageWidget.routePath,
          builder: (context, params) => AdminHomePageWidget(),
        ),
        FFRoute(
          name: OutletPageWidget.routeName,
          path: OutletPageWidget.routePath,
          builder: (context, params) => OutletPageWidget(),
        ),
        FFRoute(
          name: MenuDetailsPageWidget.routeName,
          path: MenuDetailsPageWidget.routePath,
          builder: (context, params) => MenuDetailsPageWidget(),
        ),
        FFRoute(
          name: AdminHomePage2Widget.routeName,
          path: AdminHomePage2Widget.routePath,
          builder: (context, params) => AdminHomePage2Widget(),
        ),
        FFRoute(
          name: AdminPageWidget.routeName,
          path: AdminPageWidget.routePath,
          builder: (context, params) => AdminPageWidget(),
        ),
        FFRoute(
          name: HomeDetailPageWidget.routeName,
          path: HomeDetailPageWidget.routePath,
          builder: (context, params) => HomeDetailPageWidget(),
        ),
        FFRoute(
          name: PaymentVerificationWidget.routeName,
          path: PaymentVerificationWidget.routePath,
          builder: (context, params) => PaymentVerificationWidget(),
        ),
        FFRoute(
          name: PaymentVerificationSucessWidget.routeName,
          path: PaymentVerificationSucessWidget.routePath,
          builder: (context, params) => PaymentVerificationSucessWidget(),
        ),
        FFRoute(
          name: VerifOutletPageWidget.routeName,
          path: VerifOutletPageWidget.routePath,
          builder: (context, params) => VerifOutletPageWidget(),
        ),
        FFRoute(
          name: VerifOutletSucessWidget.routeName,
          path: VerifOutletSucessWidget.routePath,
          builder: (context, params) => VerifOutletSucessWidget(),
        ),
        FFRoute(
          name: CustOrderPageWidget.routeName,
          path: CustOrderPageWidget.routePath,
          builder: (context, params) => CustOrderPageWidget(),
        ),
        FFRoute(
          name: OrderDetailPageWidget.routeName,
          path: OrderDetailPageWidget.routePath,
          builder: (context, params) => OrderDetailPageWidget(),
        ),
        FFRoute(
          name: LogoutPageWidget.routeName,
          path: LogoutPageWidget.routePath,
          builder: (context, params) => LogoutPageWidget(),
        ),
        FFRoute(
          name: AdminDetailPageWidget.routeName,
          path: AdminDetailPageWidget.routePath,
          builder: (context, params) => AdminDetailPageWidget(),
        ),
        FFRoute(
          name: BOrderPageWidget.routeName,
          path: BOrderPageWidget.routePath,
          builder: (context, params) => BOrderPageWidget(),
        ),
        FFRoute(
          name: AHomeMerchantWidget.routeName,
          path: AHomeMerchantWidget.routePath,
          builder: (context, params) => AHomeMerchantWidget(),
        ),
        FFRoute(
          name: COrderDetailSubsWidget.routeName,
          path: COrderDetailSubsWidget.routePath,
          builder: (context, params) => COrderDetailSubsWidget(),
        ),
        FFRoute(
          name: DOrderDetailEventWidget.routeName,
          path: DOrderDetailEventWidget.routePath,
          builder: (context, params) => DOrderDetailEventWidget(),
        ),
        FFRoute(
          name: ERoomChatWidget.routeName,
          path: ERoomChatWidget.routePath,
          builder: (context, params) => ERoomChatWidget(),
        ),
        FFRoute(
          name: FMerchantSayaWidget.routeName,
          path: FMerchantSayaWidget.routePath,
          builder: (context, params) => FMerchantSayaWidget(),
        ),
        FFRoute(
          name: KelolaPaketWidget.routeName,
          path: KelolaPaketWidget.routePath,
          builder: (context, params) => KelolaPaketWidget(),
        ),
        FFRoute(
          name: SssWidget.routeName,
          path: SssWidget.routePath,
          builder: (context, params) => SssWidget(),
        ),
        FFRoute(
          name: QqqWidget.routeName,
          path: QqqWidget.routePath,
          builder: (context, params) => QqqWidget(),
        ),
        FFRoute(
          name: AaaWidget.routeName,
          path: AaaWidget.routePath,
          builder: (context, params) => AaaWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
