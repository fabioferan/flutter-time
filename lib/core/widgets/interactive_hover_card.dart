import 'package:flutter/material.dart';

/// Interactive button wrapper with mouse pointer, hover feedback and smooth micro-transitions.
class InteractiveHoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color? normalColor;
  final Color? hoverColor;
  final Color? borderColor;
  final Color? hoverBorderColor;
  final double elevation;

  const InteractiveHoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius,
    this.normalColor,
    this.hoverColor,
    this.borderColor,
    this.hoverBorderColor,
    this.elevation = 0,
  });

  @override
  State<InteractiveHoverCard> createState() => _InteractiveHoverCardState();
}

class _InteractiveHoverCardState extends State<InteractiveHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = widget.borderRadius ?? BorderRadius.circular(12);

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _isHovered
              ? (widget.hoverColor ?? const Color(0xFF222A3D))
              : (widget.normalColor ?? const Color(0xFF171F33)),
          borderRadius: effectiveRadius,
          border: Border.all(
            color: _isHovered
                ? (widget.hoverBorderColor ?? const Color(0xFF7BD0FF).withValues(alpha: 0.5))
                : (widget.borderColor ?? Colors.white.withValues(alpha: 0.08)),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: effectiveRadius,
            splashColor: const Color(0xFF2563EB).withValues(alpha: 0.15),
            highlightColor: Colors.transparent,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
