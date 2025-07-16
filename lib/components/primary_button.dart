import 'package:flutter/material.dart';

class MahaPrimaryButton extends StatelessWidget {
  const MahaPrimaryButton({
    super.key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.shadowColor,
    this.elevation = 0,
    this.height,
    this.minimumHeight,
    this.width,
    this.padding,
    this.side,
    this.shape,
    this.splashFactory,
    this.tapTargetSize = MaterialTapTargetSize.shrinkWrap,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? shadowColor;
  final double elevation;
  final double? height;
  final double? minimumHeight;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final InteractiveInkFeatureFactory? splashFactory;
  final MaterialTapTargetSize tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: side ??
            BorderSide(
              color: backgroundColor ?? Colors.transparent,
              width: 1,
              style: BorderStyle.solid,
            ),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
        padding: padding,
        fixedSize: width != null
            ? Size(width!, height ?? 40)
            : Size.fromHeight(height ?? 40),
        minimumSize: width != null
            ? Size(width!, minimumHeight ?? 30)
            : Size(64, minimumHeight ?? 30),
        tapTargetSize: tapTargetSize,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        disabledBackgroundColor:
        disabledBackgroundColor ?? Theme.of(context).disabledColor,
        disabledForegroundColor:
        disabledForegroundColor ?? Theme.of(context).disabledColor,
        splashFactory: splashFactory ?? InkSparkle.splashFactory,
        foregroundColor: foregroundColor,
      ),
      child: child,
    );
  }

  factory MahaPrimaryButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? shadowColor,
    double? elevation,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    BorderSide? side,
    OutlinedBorder? shape,
    InteractiveInkFeatureFactory? splashFactory,
  }) = _MahaPrimaryButtonWithIcon;
}

class _MahaPrimaryButtonWithIcon extends MahaPrimaryButton {
  _MahaPrimaryButtonWithIcon({
    super.key,
    required super.onPressed,
    required Widget icon,
    required Widget label,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.shadowColor,
    double? elevation,
    super.height,
    super.width,
    super.padding,
    super.side,
    super.shape,
    super.splashFactory,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 8),
        label,
      ],
    ),
    elevation: elevation ?? 0,
  );
}
