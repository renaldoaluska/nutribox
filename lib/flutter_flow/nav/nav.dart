import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

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

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
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
          requireAuth: true,
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
          builder: (context, params) => MyCartPageWidget(
            outlet: params.getParam(
              'outlet',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['outlets'],
            ),
          ),
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
          requireAuth: true,
          builder: (context, params) => AdminPageWidget(
            refKeOrder: params.getParam(
              'refKeOrder',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: HomeDetailPageWidget.routeName,
          path: HomeDetailPageWidget.routePath,
          builder: (context, params) => HomeDetailPageWidget(),
        ),
        FFRoute(
          name: PaymentVerificationWidget.routeName,
          path: PaymentVerificationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PaymentVerificationWidget(),
        ),
        FFRoute(
          name: PaymentVerificationSucessGapakeWidget.routeName,
          path: PaymentVerificationSucessGapakeWidget.routePath,
          builder: (context, params) => PaymentVerificationSucessGapakeWidget(),
        ),
        FFRoute(
          name: VerifOutletPageWidget.routeName,
          path: VerifOutletPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => VerifOutletPageWidget(),
        ),
        FFRoute(
          name: VerifOutletSucessGapakeWidget.routeName,
          path: VerifOutletSucessGapakeWidget.routePath,
          builder: (context, params) => VerifOutletSucessGapakeWidget(),
        ),
        FFRoute(
          name: CustOrderPageWidget.routeName,
          path: CustOrderPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CustOrderPageWidget(),
        ),
        FFRoute(
          name: OrderDetailPageWidget.routeName,
          path: OrderDetailPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OrderDetailPageWidget(
            orderDetail: params.getParam(
              'orderDetail',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: LogoutPageWidget.routeName,
          path: LogoutPageWidget.routePath,
          builder: (context, params) => LogoutPageWidget(),
        ),
        FFRoute(
          name: AdminDetailPageGapakeWidget.routeName,
          path: AdminDetailPageGapakeWidget.routePath,
          builder: (context, params) => AdminDetailPageGapakeWidget(),
        ),
        FFRoute(
          name: COrderPageWidget.routeName,
          path: COrderPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => COrderPageWidget(),
        ),
        FFRoute(
          name: AHomeMerchantWidget.routeName,
          path: AHomeMerchantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AHomeMerchantWidget(),
        ),
        FFRoute(
          name: DOrderDetailWidget.routeName,
          path: DOrderDetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DOrderDetailWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: FMerchantSayaWidget.routeName,
          path: FMerchantSayaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FMerchantSayaWidget(),
        ),
        FFRoute(
          name: GKelolaPaketWidget.routeName,
          path: GKelolaPaketWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GKelolaPaketWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['packages'],
            ),
          ),
        ),
        FFRoute(
          name: MRekeningPencairanWidget.routeName,
          path: MRekeningPencairanWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MRekeningPencairanWidget(),
        ),
        FFRoute(
          name: NSyaratDanKetentuanWidget.routeName,
          path: NSyaratDanKetentuanWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NSyaratDanKetentuanWidget(),
        ),
        FFRoute(
          name: OBantuanWidget.routeName,
          path: OBantuanWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OBantuanWidget(),
        ),
        FFRoute(
          name: TProfilSayaWidget.routeName,
          path: TProfilSayaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TProfilSayaWidget(),
        ),
        FFRoute(
          name: ERoomChatWidget.routeName,
          path: ERoomChatWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ERoomChatWidget(),
        ),
        FFRoute(
          name: RChatListWidget.routeName,
          path: RChatListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RChatListWidget(),
        ),
        FFRoute(
          name: SLogoutPageWidget.routeName,
          path: SLogoutPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SLogoutPageWidget(),
        ),
        FFRoute(
          name: TEditProfileWidget.routeName,
          path: TEditProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TEditProfileWidget(
            profilSaya: params.getParam(
              'profilSaya',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: OutletListWidget.routeName,
          path: OutletListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OutletListWidget(),
        ),
        FFRoute(
          name: OutletDetailWidget.routeName,
          path: OutletDetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OutletDetailWidget(
            detailOutlet: params.getParam(
              'detailOutlet',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['outlets'],
            ),
          ),
        ),
        FFRoute(
          name: CobamapWidget.routeName,
          path: CobamapWidget.routePath,
          builder: (context, params) => CobamapWidget(),
        ),
        FFRoute(
          name: BSetupProfilTokoWidget.routeName,
          path: BSetupProfilTokoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BSetupProfilTokoWidget(),
        ),
        FFRoute(
          name: HBuatPaketWidget.routeName,
          path: HBuatPaketWidget.routePath,
          builder: (context, params) => HBuatPaketWidget(),
        ),
        FFRoute(
          name: HEditPaketWidget.routeName,
          path: HEditPaketWidget.routePath,
          builder: (context, params) => HEditPaketWidget(
            packageReference: params.getParam(
              'packageReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['packages'],
            ),
          ),
        ),
        FFRoute(
          name: BDaftarkanOutletWidget.routeName,
          path: BDaftarkanOutletWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BDaftarkanOutletWidget(),
        ),
        FFRoute(
          name: BStatusVerifOutletWidget.routeName,
          path: BStatusVerifOutletWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BStatusVerifOutletWidget(),
        ),
        FFRoute(
          name: PProfileTokoWidget.routeName,
          path: PProfileTokoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PProfileTokoWidget(),
        ),
        FFRoute(
          name: PEditProfilTokoWidget.routeName,
          path: PEditProfilTokoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PEditProfilTokoWidget(
            profilSaya: params.getParam(
              'profilSaya',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: DaftarAlamatPageWidget.routeName,
          path: DaftarAlamatPageWidget.routePath,
          builder: (context, params) => DaftarAlamatPageWidget(),
        ),
        FFRoute(
          name: TambahAlamatWidget.routeName,
          path: TambahAlamatWidget.routePath,
          builder: (context, params) => TambahAlamatWidget(),
        ),
        FFRoute(
          name: OrderKonfirmBayarWidget.routeName,
          path: OrderKonfirmBayarWidget.routePath,
          builder: (context, params) => OrderKonfirmBayarWidget(),
        ),
        FFRoute(
          name: HomePageCopyWidget.routeName,
          path: HomePageCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomePageCopyWidget(),
        ),
        FFRoute(
          name: OrderPageWidget.routeName,
          path: OrderPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OrderPageWidget(),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFFF8C00),
                      ),
                    ),
                  ),
                )
              : page;

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
