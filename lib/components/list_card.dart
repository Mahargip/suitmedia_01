import 'package:flutter/material.dart';

class MahaChatListCard extends StatelessWidget {
  const MahaChatListCard({
    super.key,
    this.onTap,
    this.onImageTap,
    this.onTrailingTap,
    this.width,
    this.imageRadius,
    this.imageBackgroundColor,
    required this.image,
    this.name,
    this.nameStyle,
    this.subtitle,
    this.subtitleIcon,
    this.subtitleStyle,
    this.dateSent,
    this.dateSentStyle,
    this.unreadNumber,
    this.unreadStyle,
    this.unreadBackground,
    this.useAvatar = true,
    this.trailing,
  });

  final Function()? onTap;
  final Function()? onImageTap;
  final Function()? onTrailingTap;
  final double? width;
  final double? imageRadius;
  final Color? imageBackgroundColor;
  final Widget image;
  final String? name;
  final TextStyle? nameStyle;
  final String? subtitle;
  final Widget? subtitleIcon;
  final TextStyle? subtitleStyle;
  final String? dateSent;
  final TextStyle? dateSentStyle;
  final String? unreadNumber;
  final TextStyle? unreadStyle;
  final Color? unreadBackground;
  final bool useAvatar;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? MediaQuery.sizeOf(context).width,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: useAvatar
              ? GestureDetector(
            onTap: onImageTap,
            child: CircleAvatar(
              radius: imageRadius ?? 20,
              backgroundColor:
              imageBackgroundColor ?? Color(0xFFFFF6ED),
              child: image,
            ),
          )
              : null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  name ?? '',
                  style: nameStyle ??
                      const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xFF18181B),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onTrailingTap,
                    child: trailing ??
                        Text(
                          dateSent ?? '',
                          style: dateSentStyle ??
                              const TextStyle(
                                color: Color(0xFF52525B),
                                fontSize: 12,
                              ),
                        ),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    subtitleIcon ?? const SizedBox(),
                    Flexible(
                      child: Text(
                        subtitle ?? '',
                        style: subtitleStyle ??
                            const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xFF71717A),
                              fontSize: 13,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                    unreadBackground ?? Colors.transparent,
                    child: Text(
                      unreadNumber ?? '',
                      style: unreadStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
