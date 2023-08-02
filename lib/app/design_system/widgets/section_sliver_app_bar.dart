// ignore_for_file: unused_element

import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wo/app/app.dart';

// Examples can assume:
// late String _logoAsset;
// double _myToolbarHeight = 250.0;

// ignore: avoid_private_typedef_functions
typedef _FlexibleConfigBuilder = _ScrollUnderFlexibleConfig Function(
  BuildContext context,
);

const double _kLeadingWidth =
    kToolbarHeight; // So the leading button is square.
const double _kMaxTitleTextScaleFactor = 1.34;

enum _SliverAppVariant { small, medium, large }

// Bottom justify the toolbarHeight child which may overflow the top.
class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
        );

  final double? toolbarHeight;
  final double? bottomHeight;
}

/// A Material Design app bar.
///
/// An app bar consists of a toolbar and potentially other widgets, such as a
/// [TabBar] and a [_FlexibleSpaceBar]. App bars typically expose one or more
/// common [actions] with [IconButton]s which are optionally followed by a
/// [PopupMenuButton] for less common operations (sometimes called the "overflow
/// menu").
///
/// App bars are typically used in the [Scaffold.appBar] property, which places
/// the app bar as a fixed-height widget at the top of the screen. For a scrollable
/// app bar, see [_SliverAppBar], which embeds an [AppBar] in a sliver for use in
/// a [CustomScrollView].
///
/// The AppBar displays the toolbar widgets, [leading], [title], and [actions],
/// above the [bottom] (if any). The [bottom] is usually used for a [TabBar]. If
/// a [flexibleSpace] widget is specified then it is stacked behind the toolbar
/// and the bottom widget. The following diagram shows where each of these slots
/// appears in the toolbar when the writing language is left-to-right (e.g.
/// English):
///
/// The [AppBar] insets its content based on the ambient [MediaQuery]'s padding,
/// to avoid system UI intrusions. It's taken care of by [Scaffold] when used in
/// the [Scaffold.appBar] property. When animating an [AppBar], unexpected
/// [MediaQuery] changes (as is common in [Hero] animations) may cause the content
/// to suddenly jump. Wrap the [AppBar] in a [MediaQuery] widget, and adjust its
/// padding such that the animation is smooth.
///
/// The leading widget is in the top left, the actions are in the top right,
/// the title is between them. The bottom is, naturally, at the bottom, and the
/// flexibleSpace is behind all of them.](https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png)
///
/// If the [leading] widget is omitted, but the [AppBar] is in a [Scaffold] with
/// a [Drawer], then a button will be inserted to open the drawer. Otherwise, if
/// the nearest [Navigator] has any previous routes, a [BackButton] is inserted
/// instead. This behavior can be turned off by setting the [automaticallyImplyLeading]
/// to false. In that case a null leading widget will result in the middle/title widget
/// stretching to start.
///
/// {@tool dartpad}
/// This sample shows an [AppBar] with two simple actions. The first action
/// opens a [SnackBar], while the second action navigates to a new page.
///
/// ** See code in examples/api/lib/material/app_bar/app_bar.0.dart **
/// {@end-tool}
///
/// Material Design 3 introduced new types of app bar.
/// {@tool dartpad}
/// This sample shows the creation of an [AppBar] widget with the [shadowColor] and
/// [scrolledUnderElevation] properties set, as described in:
/// https://m3.material.io/components/top-app-bar/overview
///
/// ** See code in examples/api/lib/material/app_bar/app_bar.1.dart **
/// {@end-tool}
///
/// ## Troubleshooting
///
/// ### Why don't my TextButton actions appear?
///
/// If the app bar's [actions] contains [TextButton]s, they will not
/// be visible if their foreground (text) color is the same as the
/// app bar's background color.
///
/// In Material v2 (i.e., when [ThemeData.useMaterial3] is false),
/// the default app bar [backgroundColor] is the overall theme's
/// [ColorScheme.primary] if the overall theme's brightness is
/// [Brightness.light]. Unfortunately this is the same as the default
/// [ButtonStyle.foregroundColor] for [TextButton] for light themes.
/// In this case a preferable text button foreground color is
/// [ColorScheme.onPrimary], a color that contrasts nicely with
/// [ColorScheme.primary]. To remedy the problem, override
/// [TextButton.style]:
///
/// {@tool dartpad}
/// This sample shows an [AppBar] with two action buttons with their primary
/// color set to [ColorScheme.onPrimary].
///
/// ** See code in examples/api/lib/material/app_bar/app_bar.2.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to listen to a nested Scrollable's scroll notification
/// in a nested scroll view using the [notificationPredicate] property and use it
/// to make [scrolledUnderElevation] take effect.
///
/// ** See code in examples/api/lib/material/app_bar/app_bar.3.dart **
/// {@end-tool}
///
/// See also:
///
///  * [Scaffold], which displays the [AppBar] in its [Scaffold.appBar] slot.
///  * [_SliverAppBar], which uses [AppBar] to provide a flexible app bar that
///    can be used in a [CustomScrollView].
///  * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]
///    if the screen has multiple pages arranged in tabs.
///  * [IconButton], which is used with [actions] to show buttons on the app bar.
///  * [PopupMenuButton], to show a popup menu on the app bar, via [actions].
///  * [_FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar
///    can expand and collapse.
///  * <https://material.io/design/components/app-bars-top.html>
///  * <https://m3.material.io/components/top-app-bar>
///  * Cookbook: [Place a floating app bar above a list](https://flutter.dev/docs/cookbook/lists/floating-app-bar)
class AppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a Material Design app bar.
  ///
  /// If [elevation] is specified, it must be non-negative.
  ///
  /// Typically used in the [Scaffold.appBar] property.
  AppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  })  : assert(
          elevation == null || elevation >= 0.0,
          'AppBar elevation should be greater than 0',
        ),
        preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  /// Used by [Scaffold] to compute its [AppBar]'s overall height. The returned value is
  /// the same `preferredSize.height` unless [AppBar.toolbarHeight] was null and
  /// `AppBarTheme.of(context).toolbarHeight` is non-null. In that case the
  /// return value is the sum of the theme's toolbar height and the height of
  /// the app bar's [AppBar.bottom] widget.
  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) +
          (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }

  /// {@template flutter.material.appbar.leading}
  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// Becomes the leading component of the [NavigationToolbar] built
  /// by this widget. The [leading] widget's width and height are constrained to
  /// be no bigger than [leadingWidth] and [toolbarHeight] respectively.
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// [AppBar] will imply an appropriate widget. For example, if the [AppBar] is
  /// in a [Scaffold] that also has a [Drawer], the [Scaffold] will fill this
  /// widget with an [IconButton] that opens the drawer (using [Icons.menu]). If
  /// there's no [Drawer] and the parent [Navigator] can go back, the [AppBar]
  /// will use a [BackButton] that calls [Navigator.maybePop].
  /// {@endtemplate}
  ///
  /// {@tool snippet}
  ///
  /// The following code shows how the drawer button could be manually specified
  /// instead of relying on [automaticallyImplyLeading]:
  ///
  /// ```dart
  /// AppBar(
  ///   leading: Builder(
  ///     builder: (BuildContext context) {
  ///       return IconButton(
  ///         icon: const Icon(Icons.menu),
  ///         onPressed: () { Scaffold.of(context).openDrawer(); },
  ///         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  ///       );
  ///     },
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// The [Builder] is used in this example to ensure that the `context` refers
  /// to that part of the subtree. That way this code snippet can be used even
  /// inside the very code that is creating the [Scaffold] (in which case,
  /// without the [Builder], the `context` wouldn't be able to see the
  /// [Scaffold], since it would refer to an ancestor of that widget).
  ///
  /// See also:
  ///
  ///  * [Scaffold.appBar], in which an [AppBar] is usually placed.
  ///  * [Scaffold.drawer], in which the [Drawer] is usually placed.
  final Widget? leading;

  /// {@template flutter.material.appbar.automaticallyImplyLeading}
  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  /// {@endtemplate}
  final bool automaticallyImplyLeading;

  /// {@template flutter.material.appbar.title}
  /// The primary widget displayed in the app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the app.
  /// {@endtemplate}
  ///
  /// The [title]'s width is constrained to fit within the remaining space
  /// between the toolbar's [leading] and [actions] widgets. Its height is
  /// _not_ constrained. The [title] is vertically centered and clipped to fit
  /// within the toolbar, whose height is [toolbarHeight]. Typically this
  /// isn't noticeable because a simple [Text] [title] will fit within the
  /// toolbar by default. On the other hand, it is noticeable when a
  /// widget with an intrinsic height that is greater than [toolbarHeight]
  /// is used as the [title]. For example, when the height of an Image used
  /// as the [title] exceeds [toolbarHeight], it will be centered and
  /// clipped (top and bottom), which may be undesirable. In cases like this
  /// the height of the [title] widget can be constrained. For example:
  ///
  /// ```dart
  /// MaterialApp(
  ///   home: Scaffold(
  ///     appBar: AppBar(
  ///       title: SizedBox(
  ///         height: _myToolbarHeight,
  ///         child: Image.asset(_logoAsset),
  ///       ),
  ///       toolbarHeight: _myToolbarHeight,
  ///     ),
  ///   ),
  /// )
  /// ```
  final Widget? title;

  /// {@template flutter.material.appbar.actions}
  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  ///
  /// The [actions] become the trailing component of the [NavigationToolbar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].
  ///
  /// To avoid having the last action covered by the debug banner, you may want
  /// to set the [MaterialApp.debugShowCheckedModeBanner] to false.
  /// {@endtemplate}
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Scaffold(
  ///   body: CustomScrollView(
  ///     primary: true,
  ///     slivers: <Widget>[
  ///       SliverAppBar(
  ///         title: const Text('Hello World'),
  ///         actions: <Widget>[
  ///           IconButton(
  ///             icon: const Icon(Icons.shopping_cart),
  ///             tooltip: 'Open shopping cart',
  ///             onPressed: () {
  ///               // handle the press
  ///             },
  ///           ),
  ///         ],
  ///       ),
  ///       // ...rest of body...
  ///     ],
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  final List<Widget>? actions;

  /// {@template flutter.material.appbar.flexibleSpace}
  /// This widget is stacked behind the toolbar and the tab bar. Its height will
  /// be the same as the app bar's overall height.
  ///
  /// A flexible space isn't actually flexible unless the [AppBar]'s container
  /// changes the [AppBar]'s size. A [_SliverAppBar] in a [CustomScrollView]
  /// changes the [AppBar]'s height when scrolled.
  ///
  /// Typically a [_FlexibleSpaceBar]. See [_FlexibleSpaceBar] for details.
  /// {@endtemplate}
  final Widget? flexibleSpace;

  /// {@template flutter.material.appbar.bottom}
  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// {@template flutter.material.appbar.elevation}
  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This property controls the size of the shadow below the app bar if
  /// [shadowColor] is not null.
  ///
  /// If [surfaceTintColor] is not null then it will apply a surface tint overlay
  /// to the background color (see [Material.surfaceTintColor] for more
  /// detail).
  ///
  /// The value must be non-negative.
  ///
  /// If this property is null, then [AppBarTheme.elevation] of
  /// [ThemeData.appBarTheme] is used. If that is also null, the
  /// default value is 4.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [scrolledUnderElevation], which will be used when the app bar has
  ///    something scrolled underneath it.
  ///  * [shadowColor], which is the color of the shadow below the app bar.
  ///  * [surfaceTintColor], which determines the elevation overlay that will
  ///    be applied to the background of the app bar.
  ///  * [shape], which defines the shape of the app bar's [Material] and its
  ///    shadow.
  final double? elevation;

  /// {@template flutter.material.appbar.scrolledUnderElevation}
  /// The elevation that will be used if this app bar has something
  /// scrolled underneath it.
  ///
  /// If non-null then it [AppBarTheme.scrolledUnderElevation] of
  /// [ThemeData.appBarTheme] will be used. If that is also null then [elevation]
  /// will be used.
  ///
  /// The value must be non-negative.
  ///
  /// {@endtemplate}
  ///
  /// See also:
  ///  * [elevation], which will be used if there is no content scrolled under
  ///    the app bar.
  ///  * [shadowColor], which is the color of the shadow below the app bar.
  ///  * [surfaceTintColor], which determines the elevation overlay that will
  ///    be applied to the background of the app bar.
  ///  * [shape], which defines the shape of the app bar's [Material] and its
  ///    shadow.
  final double? scrolledUnderElevation;

  /// A check that specifies which child's [ScrollNotification]s should be
  /// listened to.
  ///
  /// By default, checks whether `notification.depth == 0`. Set it to something
  /// else for more complicated layouts.
  final ScrollNotificationPredicate notificationPredicate;

  /// {@template flutter.material.appbar.shadowColor}
  /// The color of the shadow below the app bar.
  ///
  /// If this property is null, then [AppBarTheme.shadowColor] of
  /// [ThemeData.appBarTheme] is used. If that is also null, the default value
  /// is fully opaque black.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [elevation], which defines the size of the shadow below the app bar.
  ///  * [shape], which defines the shape of the app bar and its shadow.
  final Color? shadowColor;

  /// {@template flutter.material.appbar.surfaceTintColor}
  /// The color of the surface tint overlay applied to the app bar's
  /// background color to indicate elevation.
  ///
  /// If null no overlay will be applied.
  /// {@endtemplate}
  ///
  /// See also:
  ///   * [Material.surfaceTintColor], which described this feature in more detail.
  final Color? surfaceTintColor;

  /// {@template flutter.material.appbar.shape}
  /// The shape of the app bar's [Material] as well as its shadow.
  ///
  /// If this property is null, then [AppBarTheme.shape] of
  /// [ThemeData.appBarTheme] is used. Both properties default to null.
  /// If both properties are null then the shape of the app bar's [Material]
  /// is just a simple rectangle.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [elevation], which defines the size of the shadow below the app bar.
  ///  * [shadowColor], which is the color of the shadow below the app bar.
  final ShapeBorder? shape;

  /// {@template flutter.material.appbar.backgroundColor}
  /// The fill color to use for an app bar's [Material].
  ///
  /// If null, then the [AppBarTheme.backgroundColor] is used. If that value is also
  /// null, then [AppBar] uses the overall theme's [ColorScheme.primary] if the
  /// overall theme's brightness is [Brightness.light], and [ColorScheme.surface]
  /// if the overall theme's brightness is [Brightness.dark].
  ///
  /// If this color is a [MaterialStateColor] it will be resolved against
  /// [MaterialState.scrolledUnder] when the content of the app's
  /// primary scrollable overlaps the app bar.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [foregroundColor], which specifies the color for icons and text within
  ///    the app bar.
  ///  * [Theme.of], which returns the current overall Material theme as
  ///    a [ThemeData].
  ///  * [ThemeData.colorScheme], the thirteen colors that most Material widget
  ///    default colors are based on.
  ///  * [ColorScheme.brightness], which indicates if the overall [Theme]
  ///    is light or dark.
  final Color? backgroundColor;

  /// {@template flutter.material.appbar.foregroundColor}
  /// The default color for [Text] and [Icon]s within the app bar.
  ///
  /// If null, then [AppBarTheme.foregroundColor] is used. If that
  /// value is also null, then [AppBar] uses the overall theme's
  /// [ColorScheme.onPrimary] if the overall theme's brightness is
  /// [Brightness.light], and [ColorScheme.onSurface] if the overall
  /// theme's brightness is [Brightness.dark].
  ///
  /// This color is used to configure [DefaultTextStyle] that contains
  /// the toolbar's children, and the default [IconTheme] widgets that
  /// are created if [iconTheme] and [actionsIconTheme] are null.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which specifies the app bar's background color.
  ///  * [Theme.of], which returns the current overall Material theme as
  ///    a [ThemeData].
  ///  * [ThemeData.colorScheme], the thirteen colors that most Material widget
  ///    default colors are based on.
  ///  * [ColorScheme.brightness], which indicates if the overall [Theme]
  ///    is light or dark.
  final Color? foregroundColor;

  /// {@template flutter.material.appbar.iconTheme}
  /// The color, opacity, and size to use for toolbar icons.
  ///
  /// If this property is null, then a copy of [ThemeData.iconTheme]
  /// is used, with the [IconThemeData.color] set to the
  /// app bar's [foregroundColor].
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [actionsIconTheme], which defines the appearance of icons in
  ///    the [actions] list.
  final IconThemeData? iconTheme;

  /// {@template flutter.material.appbar.actionsIconTheme}
  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions].
  ///
  /// This property should only be used when the [actions] should be
  /// themed differently than the icon that appears in the app bar's [leading]
  /// widget.
  ///
  /// If this property is null, then [AppBarTheme.actionsIconTheme] of
  /// [ThemeData.appBarTheme] is used. If that is also null, then the value of
  /// [iconTheme] is used.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [iconTheme], which defines the appearance of all of the toolbar icons.
  final IconThemeData? actionsIconTheme;

  /// {@template flutter.material.appbar.primary}
  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the app bar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  /// {@endtemplate}
  final bool primary;

  /// {@template flutter.material.appbar.centerTitle}
  /// Whether the title should be centered.
  ///
  /// If this property is null, then [AppBarTheme.centerTitle] of
  /// [ThemeData.appBarTheme] is used. If that is also null, then value is
  /// adapted to the current [TargetPlatform].
  /// {@endtemplate}
  final bool? centerTitle;

  /// {@template flutter.material.appbar.excludeHeaderSemantics}
  /// Whether the title should be wrapped with header [Semantics].
  ///
  /// Defaults to false.
  /// {@endtemplate}
  final bool excludeHeaderSemantics;

  /// {@template flutter.material.appbar.titleSpacing}
  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  ///
  /// If this property is null, then [AppBarTheme.titleSpacing] of
  /// [ThemeData.appBarTheme] is used. If that is also null, then the
  /// default value is [NavigationToolbar.kMiddleSpacing].
  /// {@endtemplate}
  final double? titleSpacing;

  /// {@template flutter.material.appbar.toolbarOpacity}
  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [_SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  /// {@endtemplate}
  final double toolbarOpacity;

  /// {@template flutter.material.appbar.bottomOpacity}
  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [_SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  /// {@endtemplate}
  final double bottomOpacity;

  /// {@template flutter.material.appbar.preferredSize}
  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  /// {@endtemplate}
  @override
  final Size preferredSize;

  /// {@template flutter.material.appbar.toolbarHeight}
  /// Defines the height of the toolbar component of an [AppBar].
  ///
  /// By default, the value of [toolbarHeight] is [kToolbarHeight].
  /// {@endtemplate}
  final double? toolbarHeight;

  /// {@template flutter.material.appbar.leadingWidth}
  /// Defines the width of [leading] widget.
  ///
  /// By default, the value of [leadingWidth] is 56.0.
  /// {@endtemplate}
  final double? leadingWidth;

  /// {@template flutter.material.appbar.toolbarTextStyle}
  /// The default text style for the AppBar's [leading], and
  /// [actions] widgets, but not its [title].
  ///
  /// If this property is null, then [AppBarTheme.toolbarTextStyle] of
  /// [ThemeData.appBarTheme] is used. If that is also null, the default
  /// value is a copy of the overall theme's [TextTheme.bodyMedium]
  /// [TextStyle], with color set to the app bar's [foregroundColor].
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [titleTextStyle], which overrides the default text style for the [title].
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? toolbarTextStyle;

  /// {@template flutter.material.appbar.titleTextStyle}
  /// The default text style for the AppBar's [title] widget.
  ///
  /// If this property is null, then [AppBarTheme.titleTextStyle] of
  /// [ThemeData.appBarTheme] is used. If that is also null, the default
  /// value is a copy of the overall theme's [TextTheme.titleLarge]
  /// [TextStyle], with color set to the app bar's [foregroundColor].
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [toolbarTextStyle], which is the default text style for the AppBar's
  ///    [title], [leading], and [actions] widgets, also known as the
  ///    AppBar's "toolbar".
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? titleTextStyle;

  /// {@template flutter.material.appbar.systemOverlayStyle}
  /// Specifies the style to use for the system overlays (e.g. the status bar on
  /// Android or iOS, the system navigation bar on Android).
  ///
  /// If this property is null, then [AppBarTheme.systemOverlayStyle] of
  /// [ThemeData.appBarTheme] is used. If that is also null, an appropriate
  /// [SystemUiOverlayStyle] is calculated based on the [backgroundColor].
  ///
  /// The AppBar's descendants are built within a
  /// `AnnotatedRegion<SystemUiOverlayStyle>` widget, which causes
  /// [SystemChrome.setSystemUIOverlayStyle] to be called
  /// automatically. Apps should not enclose an AppBar with their
  /// own [AnnotatedRegion].
  /// {@endtemplate}
  //
  /// See also:
  ///
  ///  * [AnnotatedRegion], for placing [SystemUiOverlayStyle] in the layer tree.
  ///  * [SystemChrome.setSystemUIOverlayStyle], the imperative API for setting
  ///    system overlays style.
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// {@template flutter.material.appbar.forceMaterialTransparency}
  /// Forces the AppBar's Material widget type to be [MaterialType.transparency]
  /// (instead of Material's default type).
  ///
  /// This will remove the visual display of [backgroundColor] and [elevation],
  /// and affect other characteristics of the AppBar's Material widget.
  ///
  /// Provided for cases where the app bar is to be transparent, and gestures
  /// must pass through the app bar to widgets beneath the app bar (i.e. with
  /// [Scaffold.extendBodyBehindAppBar] set to true).
  ///
  /// Defaults to false.
  /// {@endtemplate}
  final bool forceMaterialTransparency;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  bool _getEffectiveCenterTitle(ThemeData theme) {
    bool platformCenter() {
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return false;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return actions == null || actions!.length < 2;
      }
    }

    return centerTitle ?? theme.appBarTheme.centerTitle ?? platformCenter();
  }

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        widget.notificationPredicate(notification)) {
      final oldScrolledUnder = _scrolledUnder;
      final metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  Color _resolveColor(
    Set<MaterialState> states,
    Color? widgetColor,
    Color? themeColor,
    Color defaultColor,
  ) {
    return MaterialStateProperty.resolveAs<Color?>(widgetColor, states) ??
        MaterialStateProperty.resolveAs<Color?>(themeColor, states) ??
        MaterialStateProperty.resolveAs<Color>(defaultColor, states);
  }

  SystemUiOverlayStyle _systemOverlayStyleForBrightness(
    Brightness brightness, [
    Color? backgroundColor,
  ]) {
    final style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    // For backward compatibility, create an overlay style without system navigation bar settings.
    return SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(
      !widget.primary || debugCheckHasMediaQuery(context),
      'if primary than has to have MediaQuery on the Context',
    );
    assert(
      debugCheckHasMaterialLocalizations(context),
      'MaterialLocalizations need to be present',
    );
    final theme = Theme.of(context);
    final iconButtonTheme = IconButtonTheme.of(context);
    final appBarTheme = AppBarTheme.of(context);
    final defaults = theme.useMaterial3
        ? _AppBarDefaultsM3(context)
        : _AppBarDefaultsM2(context);
    final scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final states = <MaterialState>{
      if (settings?.isScrolledUnder ?? _scrolledUnder)
        MaterialState.scrolledUnder,
    };

    final hasDrawer = scaffold?.hasDrawer ?? false;
    final hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final toolbarHeight =
        widget.toolbarHeight ?? appBarTheme.toolbarHeight ?? kToolbarHeight;

    final backgroundColor = _resolveColor(
      states,
      widget.backgroundColor,
      appBarTheme.backgroundColor,
      defaults.backgroundColor!,
    );

    final foregroundColor = widget.foregroundColor ??
        appBarTheme.foregroundColor ??
        defaults.foregroundColor!;

    final elevation =
        widget.elevation ?? appBarTheme.elevation ?? defaults.elevation!;

    final effectiveElevation = states.contains(MaterialState.scrolledUnder)
        ? widget.scrolledUnderElevation ??
            appBarTheme.scrolledUnderElevation ??
            defaults.scrolledUnderElevation ??
            elevation
        : elevation;

    var overallIconTheme = widget.iconTheme ??
        appBarTheme.iconTheme ??
        defaults.iconTheme!.copyWith(color: foregroundColor);

    final actionForegroundColor =
        widget.foregroundColor ?? appBarTheme.foregroundColor;
    var actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        widget.iconTheme ??
        appBarTheme.iconTheme ??
        defaults.actionsIconTheme?.copyWith(color: actionForegroundColor) ??
        overallIconTheme;

    var toolbarTextStyle = widget.toolbarTextStyle ??
        appBarTheme.toolbarTextStyle ??
        defaults.toolbarTextStyle?.copyWith(color: foregroundColor);

    var titleTextStyle = widget.titleTextStyle ??
        appBarTheme.titleTextStyle ??
        defaults.titleTextStyle?.copyWith(color: foregroundColor);

    if (widget.toolbarOpacity != 1.0) {
      final opacity = const Interval(0.25, 1, curve: Curves.fastOutSlowIn)
          .transform(widget.toolbarOpacity);
      if (titleTextStyle?.color != null) {
        titleTextStyle = titleTextStyle!
            .copyWith(color: titleTextStyle.color!.withOpacity(opacity));
      }
      if (toolbarTextStyle?.color != null) {
        toolbarTextStyle = toolbarTextStyle!
            .copyWith(color: toolbarTextStyle.color!.withOpacity(opacity));
      }
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0),
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0),
      );
    }

    var leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = DrawerButton(
          style: IconButton.styleFrom(iconSize: overallIconTheme.size ?? 24),
        );
      } else if (parentRoute?.impliesAppBarDismissal ?? false) {
        leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      if (theme.useMaterial3) {
        final IconButtonThemeData effectiveIconButtonTheme;

        // This comparison is to check if there is a custom [overallIconTheme]. If true, it means that no
        // custom [overallIconTheme] is provided, so [iconButtonTheme] is applied. Otherwise, we generate
        // a new [IconButtonThemeData] based on the values from [overallIconTheme]. If [iconButtonTheme] only
        // has null values, the default [overallIconTheme] will be applied below by [IconTheme.merge]
        if (overallIconTheme == defaults.iconTheme) {
          effectiveIconButtonTheme = iconButtonTheme;
        } else {
          // The [IconButton.styleFrom] method is used to generate a correct [overlayColor] based on the [foregroundColor].
          final leadingIconButtonStyle = IconButton.styleFrom(
            foregroundColor: overallIconTheme.color,
            iconSize: overallIconTheme.size,
          );

          effectiveIconButtonTheme = IconButtonThemeData(
            style: iconButtonTheme.style?.copyWith(
              foregroundColor: leadingIconButtonStyle.foregroundColor,
              overlayColor: leadingIconButtonStyle.overlayColor,
              iconSize: leadingIconButtonStyle.iconSize,
            ),
          );
        }

        leading = IconButtonTheme(
          data: effectiveIconButtonTheme,
          child: leading is IconButton ? Center(child: leading) : leading,
        );

        // Based on the Material Design 3 specs, the leading IconButton should have
        // a size of 48x48, and a highlight size of 40x40. Users can also put other
        // type of widgets on leading with the original config.
        leading = ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: widget.leadingWidth ?? _kLeadingWidth,
          ),
          child: leading,
        );
      } else {
        leading = ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: widget.leadingWidth ?? _kLeadingWidth,
          ),
          child: leading,
        );
      }
    }

    var title = widget.title;
    if (title != null) {
      bool? namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          namesRoute = true;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          break;
      }

      title = _AppBarTitleBox(child: title);
      if (!widget.excludeHeaderSemantics) {
        title = Semantics(
          namesRoute: namesRoute,
          header: true,
          child: title,
        );
      }

      title = DefaultTextStyle(
        style: titleTextStyle!,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: title,
      );

      // Set maximum text scale factor to [_kMaxTitleTextScaleFactor] for the
      // title to keep the visual hierarchy the same even with larger font
      // sizes. To opt out, wrap the [title] widget in a [MediaQuery] widget
      // with [MediaQueryData.textScaleFactor] set to
      // `MediaQuery.textScaleFactorOf(context)`.
      final mediaQueryData = MediaQuery.of(context);
      title = MediaQuery(
        data: mediaQueryData.copyWith(
          // ignore: deprecated_member_use
          textScaleFactor: math.min(
            // ignore: deprecated_member_use
            mediaQueryData.textScaleFactor,
            _kMaxTitleTextScaleFactor,
          ),
        ),
        child: title,
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: theme.useMaterial3
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    } else if (hasEndDrawer) {
      actions = EndDrawerButton(
        style: IconButton.styleFrom(iconSize: overallIconTheme.size ?? 24),
      );
    }

    // Allow the trailing actions to have their own theme if necessary.
    if (actions != null) {
      final IconButtonThemeData effectiveActionsIconButtonTheme;
      if (actionsIconTheme == defaults.actionsIconTheme) {
        effectiveActionsIconButtonTheme = iconButtonTheme;
      } else {
        final actionsIconButtonStyle = IconButton.styleFrom(
          foregroundColor: actionsIconTheme.color,
          iconSize: actionsIconTheme.size,
        );

        effectiveActionsIconButtonTheme = IconButtonThemeData(
          style: iconButtonTheme.style?.copyWith(
            foregroundColor: actionsIconButtonStyle.foregroundColor,
            overlayColor: actionsIconButtonStyle.overlayColor,
            iconSize: actionsIconButtonStyle.iconSize,
          ),
        );
      }

      actions = IconButtonTheme(
        data: effectiveActionsIconButtonTheme,
        child: IconTheme.merge(
          data: actionsIconTheme,
          child: actions,
        ),
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing ??
          appBarTheme.titleSpacing ??
          NavigationToolbar.kMiddleSpacing,
    );

    // If the toolbar is allocated less than toolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      clipBehavior: widget.clipBehavior ?? Clip.hardEdge,
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(toolbarHeight),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: toolbarTextStyle!,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: toolbarHeight),
              child: appBar,
            ),
          ),
          if (widget.bottomOpacity == 1.0)
            widget.bottom!
          else
            Opacity(
              opacity: const Interval(0.25, 1, curve: Curves.fastOutSlowIn)
                  .transform(widget.bottomOpacity),
              child: widget.bottom,
            ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        bottom: false,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Semantics(
            sortKey: const OrdinalSortKey(1),
            explicitChildNodes: true,
            child: widget.flexibleSpace,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(0),
            explicitChildNodes: true,
            // Creates a material widget to prevent the flexibleSpace from
            // obscuring the ink splashes produced by appBar children.
            child: Material(
              type: MaterialType.transparency,
              child: appBar,
            ),
          ),
        ],
      );
    }

    final overlayStyle = widget.systemOverlayStyle ??
        appBarTheme.systemOverlayStyle ??
        defaults.systemOverlayStyle ??
        _systemOverlayStyleForBrightness(
          ThemeData.estimateBrightnessForColor(backgroundColor),
          // Make the status bar transparent for M3 so the elevation overlay
          // color is picked up by the statusbar.
          theme.useMaterial3 ? const Color(0x00000000) : null,
        );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: backgroundColor,
          elevation: effectiveElevation,
          type: widget.forceMaterialTransparency
              ? MaterialType.transparency
              : MaterialType.canvas,
          shadowColor: widget.shadowColor ??
              appBarTheme.shadowColor ??
              defaults.shadowColor,
          surfaceTintColor: widget.surfaceTintColor ??
              appBarTheme.surfaceTintColor ??
              defaults.surfaceTintColor,
          shape: widget.shape ?? appBarTheme.shape ?? defaults.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.leading,
    required this.automaticallyImplyLeading,
    required this.title,
    required this.actions,
    required this.flexibleSpace,
    required this.bottom,
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.shadowColor,
    required this.surfaceTintColor,
    required this.forceElevated,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.iconTheme,
    required this.actionsIconTheme,
    required this.primary,
    required this.centerTitle,
    required this.excludeHeaderSemantics,
    required this.titleSpacing,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.topPadding,
    required this.floating,
    required this.pinned,
    required this.vsync,
    required this.snapConfiguration,
    required this.stretchConfiguration,
    required this.showOnScreenConfiguration,
    required this.shape,
    required this.toolbarHeight,
    required this.leadingWidth,
    required this.toolbarTextStyle,
    required this.titleTextStyle,
    required this.systemOverlayStyle,
    required this.forceMaterialTransparency,
    required this.clipBehavior,
    required this.variant,
    required this.onVisibilityUpdate,
    required this.visibilityTriggerOffset,
  })  : assert(
          primary || topPadding == 0.0,
          'if not primary than topPadding has to be 0.0',
        ),
        _bottomHeight = bottom?.preferredSize.height ?? 0.0;

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool forceElevated;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double? expandedHeight;
  final double collapsedHeight;
  final double topPadding;
  final bool floating;
  final bool pinned;
  final ShapeBorder? shape;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double _bottomHeight;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final _SliverAppVariant variant;

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max(
        topPadding +
            (expandedHeight ??
                (toolbarHeight ?? kToolbarHeight) + _bottomHeight),
        minExtent,
      );

  @override
  final TickerProvider vsync;

  @override
  final FloatingHeaderSnapConfiguration? snapConfiguration;

  @override
  final OverScrollHeaderStretchConfiguration? stretchConfiguration;

  @override
  final PersistentHeaderShowOnScreenConfiguration? showOnScreenConfiguration;

  /// Will be triggered at every build. Since this class is reconstructed at each build, we can't make
  /// a flag to avoid triggering this callback when the value is the same.
  final ValueChanged<bool> onVisibilityUpdate;
  final double visibilityTriggerOffset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final effectiveMaxExtent = maxExtent - visibilityTriggerOffset;
    if (effectiveMaxExtent <= shrinkOffset) {
      onVisibilityUpdate(false);
    } else {
      onVisibilityUpdate(true);
    }

    final visibleMainHeight = maxExtent - shrinkOffset - topPadding;
    final double extraToolbarHeight = math.max(
      minExtent -
          _bottomHeight -
          topPadding -
          (toolbarHeight ?? kToolbarHeight),
      0,
    );
    final visibleToolbarHeight =
        visibleMainHeight - _bottomHeight - extraToolbarHeight;

    final isScrolledUnder = overlapsContent ||
        forceElevated ||
        (pinned && shrinkOffset > maxExtent - minExtent);
    final isPinnedWithOpacityFade =
        pinned && floating && bottom != null && extraToolbarHeight == 0.0;
    final toolbarOpacity = !pinned || isPinnedWithOpacityFade
        ? clampDouble(
            visibleToolbarHeight / (toolbarHeight ?? kToolbarHeight),
            0,
            1,
          )
        : 1.0;
    final effectiveTitle = switch (variant) {
      _SliverAppVariant.small => title,
      _SliverAppVariant.medium || _SliverAppVariant.large => AnimatedOpacity(
          opacity: isScrolledUnder ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          curve: const Cubic(0.2, 0, 0, 1),
          child: title,
        ),
    };

    final appBar = _FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      toolbarOpacity: toolbarOpacity,
      isScrolledUnder: isScrolledUnder,
      child: AppBar(
        clipBehavior: clipBehavior,
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: effectiveTitle,
        actions: actions,
        flexibleSpace:
            (title == null && flexibleSpace != null && !excludeHeaderSemantics)
                ? Semantics(
                    header: true,
                    child: flexibleSpace,
                  )
                : flexibleSpace,
        bottom: bottom,
        elevation: isScrolledUnder ? elevation : 0.0,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        primary: primary,
        centerTitle: centerTitle,
        excludeHeaderSemantics: excludeHeaderSemantics,
        titleSpacing: titleSpacing,
        shape: shape,
        toolbarOpacity: toolbarOpacity,
        bottomOpacity:
            pinned ? 1.0 : clampDouble(visibleMainHeight / _bottomHeight, 0, 1),
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
        toolbarTextStyle: toolbarTextStyle,
        titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle,
        forceMaterialTransparency: forceMaterialTransparency,
      ),
    );
    return appBar;
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return leading != oldDelegate.leading ||
        automaticallyImplyLeading != oldDelegate.automaticallyImplyLeading ||
        title != oldDelegate.title ||
        actions != oldDelegate.actions ||
        flexibleSpace != oldDelegate.flexibleSpace ||
        bottom != oldDelegate.bottom ||
        _bottomHeight != oldDelegate._bottomHeight ||
        elevation != oldDelegate.elevation ||
        shadowColor != oldDelegate.shadowColor ||
        backgroundColor != oldDelegate.backgroundColor ||
        foregroundColor != oldDelegate.foregroundColor ||
        iconTheme != oldDelegate.iconTheme ||
        actionsIconTheme != oldDelegate.actionsIconTheme ||
        primary != oldDelegate.primary ||
        centerTitle != oldDelegate.centerTitle ||
        titleSpacing != oldDelegate.titleSpacing ||
        expandedHeight != oldDelegate.expandedHeight ||
        topPadding != oldDelegate.topPadding ||
        pinned != oldDelegate.pinned ||
        floating != oldDelegate.floating ||
        vsync != oldDelegate.vsync ||
        snapConfiguration != oldDelegate.snapConfiguration ||
        stretchConfiguration != oldDelegate.stretchConfiguration ||
        showOnScreenConfiguration != oldDelegate.showOnScreenConfiguration ||
        forceElevated != oldDelegate.forceElevated ||
        toolbarHeight != oldDelegate.toolbarHeight ||
        leadingWidth != oldDelegate.leadingWidth ||
        toolbarTextStyle != oldDelegate.toolbarTextStyle ||
        titleTextStyle != oldDelegate.titleTextStyle ||
        systemOverlayStyle != oldDelegate.systemOverlayStyle ||
        forceMaterialTransparency != oldDelegate.forceMaterialTransparency;
  }

  @override
  String toString() {
    return '${describeIdentity(this)}(topPadding: ${topPadding.toStringAsFixed(1)}, bottomHeight: ${_bottomHeight.toStringAsFixed(1)}, ...)';
  }
}

class SectionSliverAppBar extends StatefulWidget {
  const SectionSliverAppBar({
    required this.title,
    required this.iconBackgroundColor,
    required this.backgroundImageAssetPath,
    required this.expandedSystemOverlayStyle,
    required this.collapsedOverlayStyle,
    required this.icon,
    super.key,
  });

  SectionSliverAppBar.svg({
    required this.title,
    required this.iconBackgroundColor,
    required this.backgroundImageAssetPath,
    required this.expandedSystemOverlayStyle,
    required this.collapsedOverlayStyle,
    required String svgPath,
    super.key,
  }) : icon = SvgPicture.asset(
          svgPath,
          height: 40,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        );

  final String title;
  final Color iconBackgroundColor;
  final String backgroundImageAssetPath;
  final SystemUiOverlayStyle expandedSystemOverlayStyle;
  final SystemUiOverlayStyle collapsedOverlayStyle;
  final Widget icon;

  @override
  State<SectionSliverAppBar> createState() => _SectionSliverAppBarState();
}

class _SectionSliverAppBarState extends State<SectionSliverAppBar> {
  SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;

  @override
  Widget build(BuildContext context) {
    const clipRadius = 20.0;
    // Getting the size for changing the status bar color when the app bar passes by it.
    final visibilityTriggerOffset =
        MediaQuery.of(context).viewPadding.top / 2 + clipRadius;

    return _SliverAppBar(
      stretch: true,
      expandedHeight: 171,
      collapsedHeight: 122,
      systemOverlayStyle: systemOverlayStyle,
      visibilityTriggerOffset: visibilityTriggerOffset,
      onVisibilityChanged: (isVisible) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            final SystemUiOverlayStyle newSystemOverlayStyle;
            if (isVisible) {
              newSystemOverlayStyle = widget.expandedSystemOverlayStyle;
            } else {
              newSystemOverlayStyle = widget.collapsedOverlayStyle;
            }

            if (newSystemOverlayStyle != systemOverlayStyle) {
              // We need to define both, otherwise the status bar color won't change when
              // the SliverAppBar is not on screen anymore or when we change tabs, from a tab with a
              // different SystemOverlayStyle.
              SystemChrome.setSystemUIOverlayStyle(systemOverlayStyle);
              setState(() {
                systemOverlayStyle = newSystemOverlayStyle;
              });
            }
          },
        );
      },
      flexibleSpace: ClipPath(
        clipper: _BottomRoundedClipper(radius: clipRadius),
        child: _FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.all(30),
          expandedTitleScale: 1,
          background: Image.asset(
            widget.backgroundImageAssetPath,
            fit: BoxFit.cover,
          ),
          stretchModes: const [
            StretchMode.zoomBackground,
            StretchMode.fadeTitle,
          ],
          title: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 57 / 2,
                      backgroundColor: widget.iconBackgroundColor,
                      child: widget.icon,
                    ),
                    const SizedBox(height: 10),
                    WoText.titleLarge(
                      widget.title,
                      mergeStyleWith: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomRoundedClipper extends CustomClipper<Path> {
  _BottomRoundedClipper({required this.radius});

  final double radius;

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..relativeArcToPoint(
        Offset(radius, -radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width - radius, size.height - radius)
      ..relativeArcToPoint(
        Offset(radius, radius),
        radius: Radius.circular(radius),
      )
      ..relativeLineTo(0, -size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// A Material Design app bar that integrates with a [CustomScrollView].
///
/// An app bar consists of a toolbar and potentially other widgets, such as a
/// [TabBar] and a [_FlexibleSpaceBar]. App bars typically expose one or more
/// common actions with [IconButton]s which are optionally followed by a
/// [PopupMenuButton] for less common operations.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=R9C5KMJKluE}
///
/// Sliver app bars are typically used as the first child of a
/// [CustomScrollView], which lets the app bar integrate with the scroll view so
/// that it can vary in height according to the scroll offset or float above the
/// other content in the scroll view. For a fixed-height app bar at the top of
/// the screen see [AppBar], which is used in the [Scaffold.appBar] slot.
///
/// The AppBar displays the toolbar widgets, [leading], [title], and
/// [actions], above the [bottom] (if any). If a [flexibleSpace] widget is
/// specified then it is stacked behind the toolbar and the bottom widget.
///
/// {@tool snippet}
///
/// This is an example that could be included in a [CustomScrollView]'s
/// [CustomScrollView.slivers] list:
///
/// ```dart
/// SliverAppBar(
///   expandedHeight: 150.0,
///   flexibleSpace: const FlexibleSpaceBar(
///     title: Text('Available seats'),
///   ),
///   actions: <Widget>[
///     IconButton(
///       icon: const Icon(Icons.add_circle),
///       tooltip: 'Add new entry',
///       onPressed: () { /* ... */ },
///     ),
///   ]
/// )
/// ```
/// {@end-tool}
///
/// {@tool dartpad}
/// Here is an example of [_SliverAppBar] when using [stretch] and [onStretchTrigger].
///
///  ** See code in examples/api/lib/material/app_bar/sliver_app_bar.4.dart **
/// {@end-tool}
///
///
/// {@tool dartpad}
/// This sample shows a [_SliverAppBar] and it's behavior when using the
/// [pinned], [snap] and [floating] parameters.
///
/// ** See code in examples/api/lib/material/app_bar/sliver_app_bar.1.dart **
/// {@end-tool}
///
/// ## Animated Examples
///
/// The following animations show how app bars with different configurations
/// behave when a user scrolls up and then down again.
///
/// * App bar with [floating]: false, [pinned]: false, [snap]: false:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
///
/// * App bar with [floating]: true, [pinned]: false, [snap]: false:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
///
/// * App bar with [floating]: true, [pinned]: false, [snap]: true:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
///
/// * App bar with [floating]: true, [pinned]: true, [snap]: false:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned_floating.mp4}
///
/// * App bar with [floating]: true, [pinned]: true, [snap]: true:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned_floating_snap.mp4}
///
/// * App bar with [floating]: false, [pinned]: true, [snap]: false:
///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4}
///
/// The property [snap] can only be set to true if [floating] is also true.
///
/// See also:
///
///  * [CustomScrollView], which integrates the [_SliverAppBar] into its
///    scrolling.
///  * [AppBar], which is a fixed-height app bar for use in [Scaffold.appBar].
///  * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]
///    if the screen has multiple pages arranged in tabs.
///  * [IconButton], which is used with [actions] to show buttons on the app bar.
///  * [PopupMenuButton], to show a popup menu on the app bar, via [actions].
///  * [_FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar
///    can expand and collapse.
///  * <https://material.io/design/components/app-bars-top.html>
class _SliverAppBar extends StatefulWidget {
  /// Creates a Material Design app bar that can be placed in a [CustomScrollView].
  ///
  /// The arguments [forceElevated], [primary], [floating], [pinned], [snap]
  /// and [automaticallyImplyLeading] must not be null.
  const _SliverAppBar({
    required this.onVisibilityChanged,
    required this.visibilityTriggerOffset,
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  })  : assert(
          floating || !snap,
          'The "snap" argument only makes sense for floating app bars.',
        ),
        assert(
          stretchTriggerOffset > 0.0,
          'stretchTriggerOffset need to be greater than 0',
        ),
        assert(
          collapsedHeight == null || collapsedHeight >= toolbarHeight,
          'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].',
        ),
        _variant = _SliverAppVariant.small;

  /// Creates a Material Design medium top app bar that can be placed
  /// in a [CustomScrollView].
  ///
  /// Returns a [_SliverAppBar] configured with appropriate defaults
  /// for a medium top app bar as defined in Material 3. It starts fully
  /// expanded with the title in an area underneath the main row of icons.
  /// When the [CustomScrollView] is scrolled, the title will be scrolled
  /// under the main row. When it is fully collapsed, a smaller version of the
  /// title will fade in on the main row. The reverse will happen if it is
  /// expanded again.
  ///
  /// {@tool dartpad}
  /// This sample shows how to use [SliverAppBar.medium] in a [CustomScrollView].
  ///
  /// ** See code in examples/api/lib/material/app_bar/sliver_app_bar.2.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///   * [AppBar], for a small or center-aligned top app bar.
  ///   * [SliverAppBar.large], for a large top app bar.
  ///   * https://m3.material.io/components/top-app-bar/overview, the Material 3
  ///     app bar specification.
  const _SliverAppBar.medium({
    required this.onVisibilityChanged,
    required this.visibilityTriggerOffset,
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = _MediumScrollUnderFlexibleConfig.collapsedHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  })  : assert(
          floating || !snap,
          'The "snap" argument only makes sense for floating app bars.',
        ),
        assert(
          stretchTriggerOffset > 0.0,
          'stretchTriggerOffset has to be bigger than 0.0',
        ),
        assert(
          collapsedHeight == null || collapsedHeight >= toolbarHeight,
          'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].',
        ),
        _variant = _SliverAppVariant.medium;

  /// Creates a Material Design large top app bar that can be placed
  /// in a [CustomScrollView].
  ///
  /// Returns a [_SliverAppBar] configured with appropriate defaults
  /// for a large top app bar as defined in Material 3. It starts fully
  /// expanded with the title in an area underneath the main row of icons.
  /// When the [CustomScrollView] is scrolled, the title will be scrolled
  /// under the main row. When it is fully collapsed, a smaller version of the
  /// title will fade in on the main row. The reverse will happen if it is
  /// expanded again.
  ///
  /// {@tool dartpad}
  /// This sample shows how to use [SliverAppBar.large] in a [CustomScrollView].
  ///
  /// ** See code in examples/api/lib/material/app_bar/sliver_app_bar.3.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///   * [AppBar], for a small or center-aligned top app bar.
  ///   * [SliverAppBar.medium], for a medium top app bar.
  ///   * https://m3.material.io/components/top-app-bar/overview, the Material 3
  ///     app bar specification.
  const _SliverAppBar.large({
    required this.onVisibilityChanged,
    required this.visibilityTriggerOffset,
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = _LargeScrollUnderFlexibleConfig.collapsedHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  })  : assert(
          floating || !snap,
          'The "snap" argument only makes sense for floating app bars.',
        ),
        assert(
          stretchTriggerOffset > 0.0,
          'stretchTriggerOffset has to be bigger than 0',
        ),
        assert(
          collapsedHeight == null || collapsedHeight >= toolbarHeight,
          'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].',
        ),
        _variant = _SliverAppVariant.large;

  final ValueChanged<bool> onVisibilityChanged;
  final double visibilityTriggerOffset;

  /// {@macro flutter.material.appbar.leading}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? leading;

  /// {@macro flutter.material.appbar.automaticallyImplyLeading}
  ///
  /// This property is used to configure an [AppBar].
  final bool automaticallyImplyLeading;

  /// {@macro flutter.material.appbar.title}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? title;

  /// {@macro flutter.material.appbar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget>? actions;

  /// {@macro flutter.material.appbar.flexibleSpace}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? flexibleSpace;

  /// {@macro flutter.material.appbar.bottom}
  ///
  /// This property is used to configure an [AppBar].
  final PreferredSizeWidget? bottom;

  /// {@macro flutter.material.appbar.elevation}
  ///
  /// This property is used to configure an [AppBar].
  final double? elevation;

  /// {@macro flutter.material.appbar.scrolledUnderElevation}
  ///
  /// This property is used to configure an [AppBar].
  final double? scrolledUnderElevation;

  /// {@macro flutter.material.appbar.shadowColor}
  ///
  /// This property is used to configure an [AppBar].
  final Color? shadowColor;

  /// {@macro flutter.material.appbar.surfaceTintColor}
  ///
  /// This property is used to configure an [AppBar].
  final Color? surfaceTintColor;

  /// Whether to show the shadow appropriate for the [elevation] even if the
  /// content is not scrolled under the [AppBar].
  ///
  /// Defaults to false, meaning that the [elevation] is only applied when the
  /// [AppBar] is being displayed over content that is scrolled under it.
  ///
  /// When set to true, the [elevation] is applied regardless.
  ///
  /// Ignored when [elevation] is zero.
  final bool forceElevated;

  /// {@macro flutter.material.appbar.backgroundColor}
  ///
  /// This property is used to configure an [AppBar].
  final Color? backgroundColor;

  /// {@macro flutter.material.appbar.foregroundColor}
  ///
  /// This property is used to configure an [AppBar].
  final Color? foregroundColor;

  /// {@macro flutter.material.appbar.iconTheme}
  ///
  /// This property is used to configure an [AppBar].
  final IconThemeData? iconTheme;

  /// {@macro flutter.material.appbar.actionsIconTheme}
  ///
  /// This property is used to configure an [AppBar].
  final IconThemeData? actionsIconTheme;

  /// {@macro flutter.material.appbar.primary}
  ///
  /// This property is used to configure an [AppBar].
  final bool primary;

  /// {@macro flutter.material.appbar.centerTitle}
  ///
  /// This property is used to configure an [AppBar].
  final bool? centerTitle;

  /// {@macro flutter.material.appbar.excludeHeaderSemantics}
  ///
  /// This property is used to configure an [AppBar].
  final bool excludeHeaderSemantics;

  /// {@macro flutter.material.appbar.titleSpacing}
  ///
  /// This property is used to configure an [AppBar].
  final double? titleSpacing;

  /// Defines the height of the app bar when it is collapsed.
  ///
  /// By default, the collapsed height is [toolbarHeight]. If [bottom] widget is
  /// specified, then its height from [PreferredSizeWidget.preferredSize] is
  /// added to the height. If [primary] is true, then the [MediaQuery] top
  /// padding, [EdgeInsets.top] of [MediaQueryData.padding], is added as well.
  ///
  /// If [pinned] and [floating] are true, with [bottom] set, the default
  /// collapsed height is only the height of [PreferredSizeWidget.preferredSize]
  /// with the [MediaQuery] top padding.
  final double? collapsedHeight;

  /// The size of the app bar when it is fully expanded.
  ///
  /// By default, the total height of the toolbar and the bottom widget (if
  /// any). If a [flexibleSpace] widget is specified this height should be big
  /// enough to accommodate whatever that widget contains.
  ///
  /// This does not include the status bar height (which will be automatically
  /// included if [primary] is true).
  final double? expandedHeight;

  /// Whether the app bar should become visible as soon as the user scrolls
  /// towards the app bar.
  ///
  /// Otherwise, the user will need to scroll near the top of the scroll view to
  /// reveal the app bar.
  ///
  /// If [snap] is true then a scroll that exposes the app bar will trigger an
  /// animation that slides the entire app bar into view. Similarly if a scroll
  /// dismisses the app bar, the animation will slide it completely out of view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [floating] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [floating] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  ///
  /// See also:
  ///
  ///  * [_SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [pinned] and [snap].
  final bool floating;

  /// Whether the app bar should remain visible at the start of the scroll view.
  ///
  /// The app bar can still expand and contract as the user scrolls, but it will
  /// remain visible rather than being scrolled out of view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [pinned] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [pinned] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4}
  ///
  /// See also:
  ///
  ///  * [_SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [floating].
  final bool pinned;

  /// {@macro flutter.material.appbar.shape}
  ///
  /// This property is used to configure an [AppBar].
  final ShapeBorder? shape;

  /// If [snap] and [floating] are true then the floating app bar will "snap"
  /// into view.
  ///
  /// If [snap] is true then a scroll that exposes the floating app bar will
  /// trigger an animation that slides the entire app bar into view. Similarly
  /// if a scroll dismisses the app bar, the animation will slide the app bar
  /// completely out of view. Additionally, setting [snap] to true will fully
  /// expand the floating app bar when the framework tries to reveal the
  /// contents of the app bar by calling [RenderObject.showOnScreen]. For
  /// example, when a [TextField] in the floating app bar gains focus, if [snap]
  /// is true, the framework will always fully expand the floating app bar, in
  /// order to reveal the focused [TextField].
  ///
  /// Snapping only applies when the app bar is floating, not when the app bar
  /// appears at the top of its scroll view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [snap] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  /// * App bar with [snap] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
  ///
  /// See also:
  ///
  ///  * [_SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [pinned] and [floating].
  final bool snap;

  /// Whether the app bar should stretch to fill the over-scroll area.
  ///
  /// The app bar can still expand and contract as the user scrolls, but it will
  /// also stretch when the user over-scrolls.
  final bool stretch;

  /// The offset of overscroll required to activate [onStretchTrigger].
  ///
  /// This defaults to 100.0.
  final double stretchTriggerOffset;

  /// The callback function to be executed when a user over-scrolls to the
  /// offset specified by [stretchTriggerOffset].
  final AsyncCallback? onStretchTrigger;

  /// {@macro flutter.material.appbar.toolbarHeight}
  ///
  /// This property is used to configure an [AppBar].
  final double toolbarHeight;

  /// {@macro flutter.material.appbar.leadingWidth}
  ///
  /// This property is used to configure an [AppBar].
  final double? leadingWidth;

  /// {@macro flutter.material.appbar.toolbarTextStyle}
  ///
  /// This property is used to configure an [AppBar].
  final TextStyle? toolbarTextStyle;

  /// {@macro flutter.material.appbar.titleTextStyle}
  ///
  /// This property is used to configure an [AppBar].
  final TextStyle? titleTextStyle;

  /// {@macro flutter.material.appbar.systemOverlayStyle}
  ///
  /// This property is used to configure an [AppBar].
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// {@macro flutter.material.appbar.forceMaterialTransparency}
  ///
  /// This property is used to configure an [AppBar].
  final bool forceMaterialTransparency;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  final _SliverAppVariant _variant;

  @override
  State<_SliverAppBar> createState() => _SliverAppBarState();
}

// This class is only Stateful because it owns the TickerProvider used
// by the floating appbar snap animation (via FloatingHeaderSnapConfiguration).
class _SliverAppBarState extends State<_SliverAppBar>
    with TickerProviderStateMixin {
  FloatingHeaderSnapConfiguration? _snapConfiguration;
  OverScrollHeaderStretchConfiguration? _stretchConfiguration;
  PersistentHeaderShowOnScreenConfiguration? _showOnScreenConfiguration;

  void _updateSnapConfiguration() {
    if (widget.snap && widget.floating) {
      _snapConfiguration = FloatingHeaderSnapConfiguration(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    } else {
      _snapConfiguration = null;
    }

    _showOnScreenConfiguration = widget.floating & widget.snap
        ? const PersistentHeaderShowOnScreenConfiguration(
            minShowOnScreenExtent: double.infinity,
          )
        : null;
  }

  void _updateStretchConfiguration() {
    if (widget.stretch) {
      _stretchConfiguration = OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: widget.stretchTriggerOffset,
        onStretchTrigger: widget.onStretchTrigger,
      );
    } else {
      _stretchConfiguration = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _updateSnapConfiguration();
    _updateStretchConfiguration();
  }

  @override
  void didUpdateWidget(_SliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.snap != oldWidget.snap ||
        widget.floating != oldWidget.floating) {
      _updateSnapConfiguration();
    }
    if (widget.stretch != oldWidget.stretch) {
      _updateStretchConfiguration();
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(
      !widget.primary || debugCheckHasMediaQuery(context),
      'if widget is primary than it must have a MediaQuery on the context',
    );
    final bottomHeight = widget.bottom?.preferredSize.height ?? 0.0;
    final topPadding = widget.primary ? MediaQuery.paddingOf(context).top : 0.0;
    final collapsedHeight =
        (widget.pinned && widget.floating && widget.bottom != null)
            ? (widget.collapsedHeight ?? 0.0) + bottomHeight + topPadding
            : (widget.collapsedHeight ?? widget.toolbarHeight) +
                bottomHeight +
                topPadding;
    final double? effectiveExpandedHeight;
    final double effectiveCollapsedHeight;
    final Widget? effectiveFlexibleSpace;
    switch (widget._variant) {
      case _SliverAppVariant.small:
        effectiveExpandedHeight = widget.expandedHeight;
        effectiveCollapsedHeight = collapsedHeight;
        effectiveFlexibleSpace = widget.flexibleSpace;
      case _SliverAppVariant.medium:
        effectiveExpandedHeight = widget.expandedHeight ??
            _MediumScrollUnderFlexibleConfig.expandedHeight + bottomHeight;
        effectiveCollapsedHeight = widget.collapsedHeight ??
            topPadding +
                _MediumScrollUnderFlexibleConfig.collapsedHeight +
                bottomHeight;
        effectiveFlexibleSpace = widget.flexibleSpace ??
            _ScrollUnderFlexibleSpace(
              title: widget.title,
              foregroundColor: widget.foregroundColor,
              configBuilder: _MediumScrollUnderFlexibleConfig.new,
              titleTextStyle: widget.titleTextStyle,
              bottomHeight: bottomHeight,
            );
      case _SliverAppVariant.large:
        effectiveExpandedHeight = widget.expandedHeight ??
            _LargeScrollUnderFlexibleConfig.expandedHeight + bottomHeight;
        effectiveCollapsedHeight = widget.collapsedHeight ??
            topPadding +
                _LargeScrollUnderFlexibleConfig.collapsedHeight +
                bottomHeight;
        effectiveFlexibleSpace = widget.flexibleSpace ??
            _ScrollUnderFlexibleSpace(
              title: widget.title,
              foregroundColor: widget.foregroundColor,
              configBuilder: _LargeScrollUnderFlexibleConfig.new,
              titleTextStyle: widget.titleTextStyle,
              bottomHeight: bottomHeight,
            );
    }

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SliverPersistentHeader(
        floating: widget.floating,
        pinned: widget.pinned,
        delegate: _SliverAppBarDelegate(
          onVisibilityUpdate: widget.onVisibilityChanged,
          visibilityTriggerOffset: widget.visibilityTriggerOffset,
          vsync: this,
          leading: widget.leading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          title: widget.title,
          actions: widget.actions,
          flexibleSpace: effectiveFlexibleSpace,
          bottom: widget.bottom,
          elevation: widget.elevation,
          scrolledUnderElevation: widget.scrolledUnderElevation,
          shadowColor: widget.shadowColor,
          surfaceTintColor: widget.surfaceTintColor,
          forceElevated: widget.forceElevated,
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          iconTheme: widget.iconTheme,
          actionsIconTheme: widget.actionsIconTheme,
          primary: widget.primary,
          centerTitle: widget.centerTitle,
          excludeHeaderSemantics: widget.excludeHeaderSemantics,
          titleSpacing: widget.titleSpacing,
          expandedHeight: effectiveExpandedHeight,
          collapsedHeight: effectiveCollapsedHeight,
          topPadding: topPadding,
          floating: widget.floating,
          pinned: widget.pinned,
          shape: widget.shape,
          snapConfiguration: _snapConfiguration,
          stretchConfiguration: _stretchConfiguration,
          showOnScreenConfiguration: _showOnScreenConfiguration,
          toolbarHeight: widget.toolbarHeight,
          leadingWidth: widget.leadingWidth,
          toolbarTextStyle: widget.toolbarTextStyle,
          titleTextStyle: widget.titleTextStyle,
          systemOverlayStyle: widget.systemOverlayStyle,
          forceMaterialTransparency: widget.forceMaterialTransparency,
          clipBehavior: widget.clipBehavior,
          variant: widget._variant,
        ),
      ),
    );
  }
}

// Layout the AppBar's title with unconstrained height, vertically
// center it within its (NavigationToolbar) parent, and allow the
// parent to constrain the title's actual height.
class _AppBarTitleBox extends SingleChildRenderObjectWidget {
  const _AppBarTitleBox({required Widget super.child});

  @override
  _RenderAppBarTitleBox createRenderObject(BuildContext context) {
    return _RenderAppBarTitleBox(
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderAppBarTitleBox renderObject,
  ) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _RenderAppBarTitleBox extends RenderAligningShiftedBox {
  _RenderAppBarTitleBox({
    super.textDirection,
  }) : super(alignment: Alignment.center);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final innerConstraints = constraints.copyWith(maxHeight: double.infinity);
    final childSize = child!.getDryLayout(innerConstraints);
    return constraints.constrain(childSize);
  }

  @override
  void performLayout() {
    final innerConstraints = constraints.copyWith(maxHeight: double.infinity);
    child!.layout(innerConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }
}

class _ScrollUnderFlexibleSpace extends StatelessWidget {
  const _ScrollUnderFlexibleSpace({
    required this.configBuilder,
    required this.bottomHeight,
    this.title,
    this.foregroundColor,
    this.titleTextStyle,
  });

  final Widget? title;
  final Color? foregroundColor;
  final _FlexibleConfigBuilder configBuilder;
  final TextStyle? titleTextStyle;
  final double bottomHeight;

  @override
  Widget build(BuildContext context) {
    late final appBarTheme = AppBarTheme.of(context);
    late final defaults = Theme.of(context).useMaterial3
        ? _AppBarDefaultsM3(context)
        : _AppBarDefaultsM2(context);
    final double textScaleFactor = math.min(
      // ignore: deprecated_member_use
      MediaQuery.textScaleFactorOf(context),
      _kMaxTitleTextScaleFactor,
    );
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final config = configBuilder(context);
    assert(
      config.expandedTitlePadding.isNonNegative,
      'The _ExpandedTitleWithPadding widget assumes that the expanded title padding is non-negative. '
      'Update its implementation to handle negative padding.',
    );

    final expandedTextStyle = titleTextStyle ??
        appBarTheme.titleTextStyle ??
        config.expandedTextStyle?.copyWith(
          color: foregroundColor ??
              appBarTheme.foregroundColor ??
              defaults.foregroundColor,
        );

    final expandedTitle = switch ((title, expandedTextStyle)) {
      (null, _) => null,
      (final Widget title, null) => title,
      (final Widget title, final TextStyle textStyle) =>
        DefaultTextStyle(style: textStyle, child: title),
    };

    final resolvedTitlePadding =
        config.expandedTitlePadding.resolve(Directionality.of(context));
    final EdgeInsetsGeometry expandedTitlePadding = bottomHeight > 0
        ? resolvedTitlePadding.copyWith(bottom: 0)
        : resolvedTitlePadding;

    // Set maximum text scale factor to [_kMaxTitleTextScaleFactor] for the
    // title to keep the visual hierarchy the same even with larger font
    // sizes. To opt out, wrap the [title] widget in a [MediaQuery] widget
    // with [MediaQueryData.textScaleFactor] set to
    // `MediaQuery.textScaleFactorOf(context)`.
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(textScaleFactor)),
      // This column will assume the full height of the parent Stack.
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: settings.minExtent - bottomHeight),
          ),
          Flexible(
            child: ClipRect(
              child: _ExpandedTitleWithPadding(
                padding: expandedTitlePadding,
                maxExtent: settings.maxExtent - settings.minExtent,
                child: expandedTitle,
              ),
            ),
          ),
          // Reserve space for AppBar.bottom, which is a sibling of this widget,
          // on the parent Stack.
          if (bottomHeight > 0)
            Padding(padding: EdgeInsets.only(bottom: bottomHeight)),
        ],
      ),
    );
  }
}

// A widget that bottom-start aligns its child (the expanded title widget), and
// insets the child according to the specified padding.
//
// This widget gives the child an infinite max height constraint, and will also
// attempt to vertically limit the child's bounding box (not including the
// padding) to within the y range [0, maxExtent], to make sure the child is
// visible when the AppBar is fully expanded.
class _ExpandedTitleWithPadding extends SingleChildRenderObjectWidget {
  const _ExpandedTitleWithPadding({
    required this.padding,
    required this.maxExtent,
    super.child,
  });

  final EdgeInsetsGeometry padding;
  final double maxExtent;

  @override
  _RenderExpandedTitleBox createRenderObject(BuildContext context) {
    final textDirection = Directionality.of(context);
    return _RenderExpandedTitleBox(
      padding.resolve(textDirection),
      AlignmentDirectional.bottomStart.resolve(textDirection),
      maxExtent,
      null,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderExpandedTitleBox renderObject,
  ) {
    final textDirection = Directionality.of(context);
    renderObject
      ..padding = padding.resolve(textDirection)
      ..titleAlignment = AlignmentDirectional.bottomStart.resolve(textDirection)
      ..maxExtent = maxExtent;
  }
}

class _RenderExpandedTitleBox extends RenderShiftedBox {
  _RenderExpandedTitleBox(
    this._padding,
    this._titleAlignment,
    this._maxExtent,
    super.child,
  );

  EdgeInsets get padding => _padding;
  EdgeInsets _padding;

  set padding(EdgeInsets value) {
    if (_padding == value) {
      return;
    }
    assert(value.isNonNegative, "padding can't be negative");
    _padding = value;
    markNeedsLayout();
  }

  Alignment get titleAlignment => _titleAlignment;
  Alignment _titleAlignment;

  set titleAlignment(Alignment value) {
    if (_titleAlignment == value) {
      return;
    }
    _titleAlignment = value;
    markNeedsLayout();
  }

  double get maxExtent => _maxExtent;
  double _maxExtent;

  set maxExtent(double value) {
    if (_maxExtent == value) {
      return;
    }
    _maxExtent = value;
    markNeedsLayout();
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final child = this.child;
    return child == null
        ? 0.0
        : child.getMaxIntrinsicHeight(math.max(0, width - padding.horizontal)) +
            padding.vertical;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final child = this.child;
    return child == null
        ? 0.0
        : child.getMaxIntrinsicWidth(double.infinity) + padding.horizontal;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final child = this.child;
    return child == null
        ? 0.0
        : child.getMinIntrinsicHeight(math.max(0, width - padding.horizontal)) +
            padding.vertical;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final child = this.child;
    return child == null
        ? 0.0
        : child.getMinIntrinsicWidth(double.infinity) + padding.horizontal;
  }

  Size _computeSize(BoxConstraints constraints, ChildLayouter layoutChild) {
    final child = this.child;
    if (child == null) {
      return Size.zero;
    }
    layoutChild(child, constraints.widthConstraints().deflate(padding));
    return constraints.biggest;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeSize(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    final child = this.child;
    if (child == null) {
      this.size = constraints.smallest;
      return;
    }
    final size =
        this.size = _computeSize(constraints, ChildLayoutHelper.layoutChild);
    final childSize = child.size;

    assert(padding.isNonNegative, "padding can't be negative");
    assert(titleAlignment.y == 1.0, 'titleAlignment.y should be equal to 1.0');
    // yAdjustement is the minimum additional y offset to shift the child in
    // the visible vertical space when AppBar is fully expanded. The goal is to
    // prevent the expanded title from being clipped when the expanded title
    // widget + the bottom padding is too tall to fit in the flexible space (the
    // top padding is basically ignored since the expanded title is
    // bottom-aligned).
    final yAdjustement = clampDouble(
      childSize.height + padding.bottom - maxExtent,
      0,
      padding.bottom,
    );
    final offsetY =
        size.height - childSize.height - padding.bottom + yAdjustement;
    final offsetX = (titleAlignment.x + 1) /
            2 *
            (size.width - padding.horizontal - childSize.width) +
        padding.left;

    final childParentData = child.parentData! as BoxParentData;
    // ignore: cascade_invocations
    childParentData.offset = Offset(offsetX, offsetY);
  }
}

mixin _ScrollUnderFlexibleConfig {
  TextStyle? get collapsedTextStyle;

  TextStyle? get expandedTextStyle;

  EdgeInsetsGeometry get expandedTitlePadding;
}

// Hand coded defaults based on Material Design 2.
class _AppBarDefaultsM2 extends AppBarTheme {
  _AppBarDefaultsM2(this.context)
      : super(
          elevation: 4,
          shadowColor: const Color(0xFF000000),
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          toolbarHeight: kToolbarHeight,
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  Color? get backgroundColor =>
      _colors.brightness == Brightness.dark ? _colors.surface : _colors.primary;

  @override
  Color? get foregroundColor => _colors.brightness == Brightness.dark
      ? _colors.onSurface
      : _colors.onPrimary;

  @override
  IconThemeData? get iconTheme => _theme.iconTheme;

  @override
  TextStyle? get toolbarTextStyle => _theme.textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _theme.textTheme.titleLarge;
}

// BEGIN GENERATED TOKEN PROPERTIES - AppBar

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

class _AppBarDefaultsM3 extends AppBarTheme {
  _AppBarDefaultsM3(this.context)
      : super(
          elevation: 0,
          scrolledUnderElevation: 3,
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          toolbarHeight: 64,
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get foregroundColor => _colors.onSurface;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get surfaceTintColor => _colors.surfaceTint;

  @override
  IconThemeData? get iconTheme => IconThemeData(
        color: _colors.onSurface,
        size: 24,
      );

  @override
  IconThemeData? get actionsIconTheme => IconThemeData(
        color: _colors.onSurfaceVariant,
        size: 24,
      );

  @override
  TextStyle? get toolbarTextStyle => _textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _textTheme.titleLarge;
}

// Variant configuration
class _MediumScrollUnderFlexibleConfig with _ScrollUnderFlexibleConfig {
  _MediumScrollUnderFlexibleConfig(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  static const double collapsedHeight = 64;
  static const double expandedHeight = 112;

  @override
  TextStyle? get collapsedTextStyle =>
      _textTheme.titleLarge?.apply(color: _colors.onSurface);

  @override
  TextStyle? get expandedTextStyle =>
      _textTheme.headlineSmall?.apply(color: _colors.onSurface);

  @override
  EdgeInsetsGeometry get expandedTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 20);
}

class _LargeScrollUnderFlexibleConfig with _ScrollUnderFlexibleConfig {
  _LargeScrollUnderFlexibleConfig(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  static const double collapsedHeight = 64;
  static const double expandedHeight = 152;

  @override
  TextStyle? get collapsedTextStyle =>
      _textTheme.titleLarge?.apply(color: _colors.onSurface);

  @override
  TextStyle? get expandedTextStyle =>
      _textTheme.headlineMedium?.apply(color: _colors.onSurface);

  @override
  EdgeInsetsGeometry get expandedTitlePadding =>
      const EdgeInsets.fromLTRB(16, 0, 16, 28);
}

// END GENERATED TOKEN PROPERTIES - AppBar

/// The collapsing effect while the space bar collapses from its full size.
enum CollapseMode {
  /// The background widget will scroll in a parallax fashion.
  parallax,

  /// The background widget pin in place until it reaches the min extent.
  pin,

  /// The background widget will act as normal with no collapsing effect.
  none,
}

/// The stretching effect while the space bar stretches beyond its full size.
enum StretchMode {
  /// The background widget will expand to fill the extra space.
  zoomBackground,

  // ignore: comment_references
  /// The background will blur using a [ImageFilter.blur] effect.
  blurBackground,

  /// The title will fade away as the user over-scrolls.
  fadeTitle,
}

/// The part of a Material Design [AppBar] that expands, collapses, and
/// stretches.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=mSc7qFzxHDw}
///
/// Most commonly used in the [SliverAppBar.flexibleSpace] field, a flexible
/// space bar expands and contracts as the app scrolls so that the [AppBar]
/// reaches from the top of the app to the top of the scrolling contents of the
/// app. When using [SliverAppBar.flexibleSpace], the [SliverAppBar.expandedHeight]
/// must be large enough to accommodate the [SliverAppBar.flexibleSpace] widget.
///
/// Furthermore is included functionality for stretch behavior. When
/// [SliverAppBar.stretch] is true, and your [ScrollPhysics] allow for
/// overscroll, this space will stretch with the overscroll.
///
/// The widget that sizes the [AppBar] must wrap it in the widget returned by
/// [_FlexibleSpaceBar.createSettings], to convey sizing information down to the
/// [_FlexibleSpaceBar].
///
/// {@tool dartpad}
/// This sample application demonstrates the different features of the
/// [_FlexibleSpaceBar] when used in a [SliverAppBar]. This app bar is configured
/// to stretch into the overscroll space, and uses the
/// [_FlexibleSpaceBar.stretchModes] to apply `fadeTitle`, `blurBackground` and
/// `zoomBackground`. The app bar also makes use of [CollapseMode.parallax] by
/// default.
///
/// ** See code in examples/api/lib/material/flexible_space_bar/flexible_space_bar.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [SliverAppBar], which implements the expanding and contracting.
///  * [AppBar], which is used by [SliverAppBar].
///  * <https://material.io/design/components/app-bars-top.html#behavior>
class _FlexibleSpaceBar extends StatefulWidget {
  /// Creates a flexible space bar.
  ///
  /// Most commonly used in the [AppBar.flexibleSpace] field.
  const _FlexibleSpaceBar({
    super.key,
    this.title,
    this.background,
    this.centerTitle,
    this.titlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    this.expandedTitleScale = 1.5,
  }) : assert(
          expandedTitleScale >= 1,
          'expandedTitleScale must be greater than 1',
        );

  /// The primary contents of the flexible space bar when expanded.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Shown behind the [title] when expanded.
  ///
  /// Typically an [Image] widget with [Image.fit] set to [BoxFit.cover].
  final Widget? background;

  /// Whether the title should be centered.
  ///
  /// By default this property is true if the current target platform
  /// is [TargetPlatform.iOS] or [TargetPlatform.macOS], false otherwise.
  final bool? centerTitle;

  /// Collapse effect while scrolling.
  ///
  /// Defaults to [CollapseMode.parallax].
  final CollapseMode collapseMode;

  /// Stretch effect while over-scrolling.
  ///
  /// Defaults to include [StretchMode.zoomBackground].
  final List<StretchMode> stretchModes;

  /// Defines how far the [title] is inset from either the widget's
  /// bottom-left or its center.
  ///
  /// Typically this property is used to adjust how far the title is
  /// inset from the bottom-left and it is specified along with
  /// [centerTitle] false.
  ///
  /// By default the value of this property is
  /// `EdgeInsetsDirectional.only(start: 72, bottom: 16)` if the title is
  /// not centered, `EdgeInsetsDirectional.only(start: 0, bottom: 16)` otherwise.
  final EdgeInsetsGeometry? titlePadding;

  /// Defines how much the title is scaled when the FlexibleSpaceBar is expanded
  /// due to the user scrolling downwards. The title is scaled uniformly on the
  /// x and y axes while maintaining its bottom-left position (bottom-center if
  /// [centerTitle] is true).
  ///
  /// Defaults to 1.5 and must be greater than 1.
  final double expandedTitleScale;

  /// Wraps a widget that contains an [AppBar] to convey sizing information down
  /// to the [_FlexibleSpaceBar].
  ///
  /// Used by [Scaffold] and [SliverAppBar].
  ///
  /// `toolbarOpacity` affects how transparent the text within the toolbar
  /// appears. `minExtent` sets the minimum height of the resulting
  /// [_FlexibleSpaceBar] when fully collapsed. `maxExtent` sets the maximum
  /// height of the resulting [_FlexibleSpaceBar] when fully expanded.
  /// `currentExtent` sets the scale of the [_FlexibleSpaceBar.background] and
  /// [_FlexibleSpaceBar.title] widgets of [_FlexibleSpaceBar] upon
  /// initialization. `scrolledUnder` is true if the [_FlexibleSpaceBar]
  /// overlaps the app's primary scrollable, false if it does not, and null
  /// if the caller has not determined as much.
  /// See also:
  ///
  ///  * [FlexibleSpaceBarSettings] which creates a settings object that can be
  ///    used to specify these settings to a [_FlexibleSpaceBar].
  static Widget createSettings({
    required double currentExtent,
    required Widget child,
    double? toolbarOpacity,
    double? minExtent,
    double? maxExtent,
    bool? isScrolledUnder,
  }) {
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      isScrolledUnder: isScrolledUnder,
      currentExtent: currentExtent,
      child: child,
    );
  }

  @override
  State<_FlexibleSpaceBar> createState() => _FlexibleSpaceBarState();
}

class _FlexibleSpaceBarState extends State<_FlexibleSpaceBar> {
  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null) {
      return widget.centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle) {
      return Alignment.bottomCenter;
    }
    final textDirection = Directionality.of(context);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
  }

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0;
      case CollapseMode.parallax:
        final deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0, end: deltaExtent / 4.0).transform(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final children = <Widget>[];

        final deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final t = clampDouble(
          1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent,
          0,
          1,
        );

        // background
        if (widget.background != null) {
          final double fadeStart =
              math.max(0, 1.0 - kToolbarHeight / deltaExtent);
          const fadeEnd = 1.0;
          assert(
            fadeStart <= fadeEnd,
            'fadeStart should be smaller or equal to fadeEnd',
          );
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          // final opacity = settings.maxExtent == settings.minExtent ? 1.0 : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          // Making it always visible
          const opacity = 1.0;
          var height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (widget.stretchModes.contains(StretchMode.zoomBackground) &&
              constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }
          final topPadding = _getCollapsePadding(t, settings);
          children.add(
            Positioned(
              top: topPadding,
              left: 0,
              right: 0,
              height: height,
              child: _FlexibleSpaceHeaderOpacity(
                // IOS is relying on this semantics node to correctly traverse
                // through the app bar when it is collapsed.
                alwaysIncludeSemantics: true,
                opacity: opacity,
                child: widget.background,
              ),
            ),
          );

          // StretchMode.blurBackground
          if (widget.stretchModes.contains(StretchMode.blurBackground) &&
              constraints.maxHeight > settings.maxExtent) {
            final blurAmount =
                (constraints.maxHeight - settings.maxExtent) / 10;
            children.add(
              Positioned.fill(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: blurAmount,
                    sigmaY: blurAmount,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            );
          }
        }

        // title
        if (widget.title != null) {
          final theme = Theme.of(context);

          Widget? title;
          switch (theme.platform) {
            case TargetPlatform.iOS:
            case TargetPlatform.macOS:
              title = widget.title;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
            case TargetPlatform.linux:
            case TargetPlatform.windows:
              title = Semantics(
                namesRoute: true,
                child: widget.title,
              );
          }

          // StretchMode.fadeTitle
          if (widget.stretchModes.contains(StretchMode.fadeTitle) &&
              constraints.maxHeight > settings.maxExtent) {
            final stretchOpacity = 1 -
                clampDouble(
                  (constraints.maxHeight - settings.maxExtent) / 100,
                  0,
                  1,
                );
            title = Opacity(
              opacity: stretchOpacity,
              child: title,
            );
          }

          // final opacity = settings.toolbarOpacity;
          // Making it always visible.
          const opacity = 1.0;
          if (opacity > 0.0) {
            var titleStyle = theme.primaryTextTheme.titleLarge!;
            titleStyle = titleStyle.copyWith(
              color: titleStyle.color!.withOpacity(opacity),
            );
            final effectiveCenterTitle = _getEffectiveCenterTitle(theme);
            final padding = widget.titlePadding ??
                EdgeInsetsDirectional.only(
                  start: effectiveCenterTitle ? 0.0 : 72.0,
                  bottom: 16,
                );
            final scaleValue =
                Tween<double>(begin: widget.expandedTitleScale, end: 1)
                    .transform(t);
            final scaleTransform = Matrix4.identity()
              ..scale(scaleValue, scaleValue, 1);
            final titleAlignment = _getTitleAlignment(effectiveCenterTitle);
            children.add(
              Container(
                padding: padding,
                child: Transform(
                  alignment: titleAlignment,
                  transform: scaleTransform,
                  child: Align(
                    alignment: titleAlignment,
                    child: DefaultTextStyle(
                      style: titleStyle,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            width: constraints.maxWidth / scaleValue,
                            alignment: titleAlignment,
                            child: title,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }

        return ClipRect(child: Stack(children: children));
      },
    );
  }
}

/// Provides sizing and opacity information to a [_FlexibleSpaceBar].
///
/// See also:
///
///  * [_FlexibleSpaceBar] which creates a flexible space bar.
class FlexibleSpaceBarSettings extends InheritedWidget {
  /// Creates a Flexible Space Bar Settings widget.
  ///
  /// Used by [Scaffold] and [SliverAppBar]. [child] must have a
  /// [_FlexibleSpaceBar] widget in its tree for the settings to take affect.
  ///
  /// The required [toolbarOpacity], [minExtent], [maxExtent], [currentExtent],
  /// and [child] parameters must not be null.
  const FlexibleSpaceBarSettings({
    required this.toolbarOpacity,
    required this.minExtent,
    required this.maxExtent,
    required this.currentExtent,
    required super.child,
    super.key,
    this.isScrolledUnder,
  })  : assert(minExtent >= 0, 'minExtent must be greater than or equal to 0'),
        assert(maxExtent >= 0, 'maxExtent must be greater than or equal to 0'),
        assert(
          currentExtent >= 0,
          'currentExtent must be greater than or equal to 0',
        ),
        assert(
          toolbarOpacity >= 0.0,
          'toolbarOpacity must be greater than or equal to 0',
        ),
        assert(
          minExtent <= maxExtent,
          'minExtent must be smaller or equal to maxExtent',
        ),
        assert(
          minExtent <= currentExtent,
          'minExtent must be smaller or equal to currentExtent',
        ),
        assert(
          currentExtent <= maxExtent,
          'currentExtent must be smaller or equal to maxExtent',
        );

  /// Affects how transparent the text within the toolbar appears.
  final double toolbarOpacity;

  /// Minimum height of the resulting [_FlexibleSpaceBar] when fully collapsed.
  final double minExtent;

  /// Maximum height of the resulting [_FlexibleSpaceBar] when fully expanded.
  final double maxExtent;

  /// If the [_FlexibleSpaceBar.title] or the [_FlexibleSpaceBar.background] is
  /// not null, then this value is used to calculate the relative scale of
  /// these elements upon initialization.
  final double currentExtent;

  /// True if the FlexibleSpaceBar overlaps the primary scrollable's contents.
  ///
  /// This value is used by the [AppBar] to resolve
  /// [AppBar.backgroundColor] against [MaterialState.scrolledUnder],
  /// i.e. to enable apps to specify different colors when content
  /// has been scrolled up and behind the app bar.
  ///
  /// Null if the caller hasn't determined if the FlexibleSpaceBar
  /// overlaps the primary scrollable's contents.
  final bool? isScrolledUnder;

  @override
  bool updateShouldNotify(FlexibleSpaceBarSettings oldWidget) {
    return toolbarOpacity != oldWidget.toolbarOpacity ||
        minExtent != oldWidget.minExtent ||
        maxExtent != oldWidget.maxExtent ||
        currentExtent != oldWidget.currentExtent ||
        isScrolledUnder != oldWidget.isScrolledUnder;
  }
}

// We need the child widget to repaint, however both the opacity
// and potentially `widget.background` can be constant which won't
// lead to repainting.
// see: https://github.com/flutter/flutter/issues/127836
class _FlexibleSpaceHeaderOpacity extends SingleChildRenderObjectWidget {
  const _FlexibleSpaceHeaderOpacity({
    required this.opacity,
    required super.child,
    required this.alwaysIncludeSemantics,
  });

  final double opacity;
  final bool alwaysIncludeSemantics;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderFlexibleSpaceHeaderOpacity(
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderFlexibleSpaceHeaderOpacity renderObject,
  ) {
    renderObject
      ..alwaysIncludeSemantics = alwaysIncludeSemantics
      ..opacity = opacity;
  }
}

class _RenderFlexibleSpaceHeaderOpacity extends RenderOpacity {
  _RenderFlexibleSpaceHeaderOpacity({
    super.opacity,
    super.alwaysIncludeSemantics,
  });

  @override
  bool get isRepaintBoundary => false;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    if (opacity == 0) {
      layer = null;
      return;
    }
    assert(needsCompositing, 'must not need compositing');
    layer = context.pushOpacity(
      offset,
      (opacity * 255).round(),
      super.paint,
      oldLayer: layer as OpacityLayer?,
    );
    assert(
      () {
        layer!.debugCreator = debugCreator;
        return true;
      }(),
      '',
    );
  }
}
