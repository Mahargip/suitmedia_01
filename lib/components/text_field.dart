import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MahaTextField extends StatelessWidget {
  /// Customized [TextField] for Maha Flutter Platform.
  const MahaTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onTap,
    this.onChanged,
    this.margin,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.maxLines,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isEnabled = true,
    this.textStyle,
    this.height,
    this.cornerRadius,
    this.action,
    this.focusNode,
    this.minLines,
    this.isExpand = true,
    this.isRequired = false,
    this.labelVerticalSpace = 4,
    this.disabledBorder,
    this.isFilled = false,
    this.fillColor,
    this.initialValue,
    this.isFixedHeight = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = false,
    this.contentPadding,
    required this.borderColor,
    required this.focusedBorderColor,
    this.maxLength,
    this.counterText = '',
    this.showCursor = true,
    @Deprecated(
      '\nThis property is added to accomodate the existing implementation. It is not recommended to use this property.\n\n'
      'You can modify theme data instead to achieve the same result.',
    )
    this.labelStyle,
    this.inputFormatters,
  }) : assert(
         obscureText == true && maxLines == 1 || obscureText == false,
         'maxLines must be 1 if obscureText is true',
       );

  /// The text to display in the [TextField] as a hint when the field is empty.
  final String? hintText;

  /// The [TextEditingController] that will control the text being edited.
  final TextEditingController? controller;

  /// The [Function] that will be called when the [TextField] is tapped.
  final VoidCallback? onTap;

  /// The [Function] that will be called when the text in the [TextField] changes.
  final ValueChanged<String>? onChanged;

  /// The [EdgeInsetsGeometry] to apply to the [TextField] as margin.
  final EdgeInsetsGeometry? margin;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool autofocus;

  /// The [Widget] that will be displayed as prefix icon.
  final Widget? prefixIcon;

  /// The [Widget] that will be displayed as suffix icon.
  final Widget? suffixIcon;

  /// The [String] that will be displayed as label.
  final String? label;

  /// The maximum number of lines the user can enter.
  final int? maxLines;

  /// The minimum number of lines the user can enter.
  final int? minLines;

  /// The [TextInputAction] that will be displayed as action.
  final double? height;

  /// The [TextInputAction] that will be displayed as action.
  final double? cornerRadius;

  /// The [TextInputAction] that will be displayed as action.
  final bool readOnly;

  /// The [TextInputAction] that will be displayed as action.
  final bool isEnabled;

  /// The [TextInputAction] that will be displayed as action.
  final bool obscureText;

  /// The [TextInputAction] that will be displayed as action.
  final bool isExpand;

  /// The [TextInputAction] that will be displayed as action.
  final bool isRequired;

  /// The [TextInputAction] that will be displayed as action.
  final TextInputAction? textInputAction;

  /// The [TextInputType] that will be displayed as keyboard type.
  final TextInputType? keyboardType;

  /// The [TextStyle] that will be displayed as text style.
  final TextStyle? textStyle;

  /// The [Widget] that will be displayed as action.
  final Widget? action;

  /// The [FocusNode] that will be displayed as focus node.
  final FocusNode? focusNode;

  /// The [double] that will be displayed as label vertical space.
  final double labelVerticalSpace;

  /// The [InputBorder] that will be displayed as disabled border.
  final InputBorder? disabledBorder;

  /// The [bool] that will be displayed as is filled.
  final bool isFilled;

  /// The [Color] that will be displayed as fill color.
  final Color? fillColor;

  /// The [String] that will be displayed as initial value.
  final String? initialValue;

  /// Set if textfield will use fixed height
  final bool isFixedHeight;

  /// Set if auto correct is enabled
  final bool autocorrect;

  /// Set text capitalization behavior of textfield
  final TextCapitalization textCapitalization;

  /// Content padding for textfield
  final EdgeInsetsGeometry? contentPadding;

  /// Change the default border color
  final Color borderColor;

  /// Change the default focused border color
  final Color focusedBorderColor;

  /// The maximum number of characters (Unicode scalar values) that the user can enter.
  final int? maxLength;

  /// The [String] that will be displayed as counter text.
  final String? counterText;

  /// Custom [TextStyle] for label
  final TextStyle? labelStyle;

  /// Show cursor in textfield
  final bool showCursor;

  /// The [TextInputFormatter] that will be displayed as input formatters.
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: label ?? '',
                    children: [
                      if (isRequired)
                        TextSpan(
                          text: ' *',
                          style:
                              labelStyle?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ) ??
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                    ],
                  ),
                  style: labelStyle ?? Theme.of(context).textTheme.titleSmall,
                ),
                if (action != null) action!,
              ],
            ),
            SizedBox(height: labelVerticalSpace),
          ],
          if (isFixedHeight)
            SizedBox(
              height: height ?? 44,
              child: TextFormField(
                onTap: onTap,
                focusNode: focusNode,
                maxLines: maxLines,
                initialValue: initialValue,
                autofocus: autofocus,
                textCapitalization: textCapitalization,
                autocorrect: autocorrect,
                minLines: minLines,
                controller: controller,
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                readOnly: readOnly,
                enabled: isEnabled,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                obscureText: obscureText,
                style: textStyle,
                maxLength: maxLength,
                expands: isExpand,
                showCursor: showCursor,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  disabledBorder: disabledBorder,
                  counterText: counterText,
                  hintStyle: textStyle?.copyWith(color: Colors.grey[500]),
                  contentPadding:
                      contentPadding ??
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  filled: isFilled,
                  fillColor: fillColor,
                  enabled: isEnabled,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide:
                        Theme.of(
                          context,
                        ).inputDecorationTheme.focusedBorder?.borderSide ??
                        BorderSide(width: 1, color: focusedBorderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide:
                        Theme.of(
                          context,
                        ).inputDecorationTheme.enabledBorder?.borderSide ??
                        BorderSide(width: 1, color: borderColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide:
                        Theme.of(
                          context,
                        ).inputDecorationTheme.border?.borderSide ??
                        BorderSide(width: 1, color: borderColor),
                  ),
                ),
                onChanged: onChanged,
              ),
            )
          else
            TextFormField(
              onTap: onTap,
              focusNode: focusNode,
              maxLines: maxLines,
              initialValue: initialValue,
              autofocus: autofocus,
              minLines: minLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              readOnly: readOnly,
              enabled: isEnabled,
              obscureText: obscureText,
              style: textStyle,
              expands: isExpand,
              showCursor: showCursor,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                disabledBorder: disabledBorder,
                hintStyle:
                    textStyle?.copyWith(
                      color: Theme.of(
                        context,
                      ).inputDecorationTheme.hintStyle?.color,
                    ) ??
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(
                        context,
                      ).inputDecorationTheme.hintStyle?.color,
                    ),
                contentPadding:
                    contentPadding ??
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                filled: isFilled,
                fillColor: fillColor,
                enabled: isEnabled,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide: BorderSide(width: 1, color: focusedBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide:
                      Theme.of(
                        context,
                      ).inputDecorationTheme.enabledBorder?.borderSide ??
                      BorderSide(width: 1, color: borderColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide:
                      Theme.of(
                        context,
                      ).inputDecorationTheme.border?.borderSide ??
                      BorderSide(width: 1, color: borderColor),
                ),
              ),
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }
}
