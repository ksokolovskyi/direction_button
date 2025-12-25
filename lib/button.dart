import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/rendering.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

part 'gradients.dart';

const _minButtonWidth = 164.0;
const _minOverlayWidth = 48.0;
const _buttonHeight = 40.0;

class Button extends StatefulWidget {
  const Button({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  final ValueNotifier<bool> _isOverlayExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isOverlayExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        _isOverlayExpanded.value = true;
      },
      onExit: (_) {
        _isOverlayExpanded.value = false;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(
            width: _minButtonWidth,
            height: _buttonHeight,
          ),
          child: SizedBox.expand(
            child: RepaintBoundary(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color(0xFF212631),
                ),
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: _minOverlayWidth + 8,
                          right: 8,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Center(
                          child: Text(
                            'Book a demo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 14 / 20,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _ButtonOverlay(isExpanded: _isOverlayExpanded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonOverlay extends StatefulWidget {
  const _ButtonOverlay({
    required this.isExpanded,
  });

  final ValueNotifier<bool> isExpanded;

  @override
  State<_ButtonOverlay> createState() => _ButtonOverlayState();
}

class _ButtonOverlayState extends State<_ButtonOverlay>
    with TickerProviderStateMixin {
  late final _expansionController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _expansionAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Curves.ease)).animate(_expansionController);

  late final Animation<double> _arrowsOpacityAnimation =
      Tween<double>(begin: 0, end: 1)
          .chain(CurveTween(curve: const Interval(0, 0.5)))
          .animate(_expansionController);

  late final _gradientsController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  );

  late final Animation<double> _gradientsTranslationAnimation = Tween<double>(
    begin: 0,
    end: 0.5,
  ).animate(_gradientsController);

  late final _painter = _ArrowsPainter(
    gradientTranslation: _gradientsTranslationAnimation,
    opacity: _arrowsOpacityAnimation,
  );

  @override
  void initState() {
    super.initState();

    _gradientsController.repeat();

    widget.isExpanded.addListener(_syncExpansion);

    _expansionController.value = widget.isExpanded.value ? 1 : 0;
  }

  @override
  void didUpdateWidget(covariant _ButtonOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isExpanded != oldWidget.isExpanded) {
      oldWidget.isExpanded.removeListener(_syncExpansion);
      widget.isExpanded.addListener(_syncExpansion);
    }
  }

  @override
  void dispose() {
    widget.isExpanded.removeListener(_syncExpansion);

    _expansionController.dispose();
    _gradientsController.dispose();

    super.dispose();
  }

  void _syncExpansion() {
    if (widget.isExpanded.value) {
      _expansionController.forward();
    } else {
      _expansionController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _expansionAnimation,
      builder: (context, child) {
        return _ButtonOverlayExpandingBox(
          initialWidth: _minOverlayWidth,
          expansionFactor: _expansionAnimation.value,
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(
              colors: [
                Color.alphaBlend(
                  const Color.fromRGBO(255, 255, 255, 0.32),
                  const Color(0xFFD2FF00),
                ),
                Color.alphaBlend(
                  const Color.fromRGBO(255, 255, 255, 0),
                  const Color(0xFFD2FF00),
                ),
              ],
              stops: const [0, 0.7751],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 1,
                spreadRadius: -0.5,
                color: Color.fromRGBO(11, 21, 34, 0.24),
              ),
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3,
                spreadRadius: -1.5,
                color: Color.fromRGBO(11, 21, 34, 0.24),
              ),
              BoxShadow(
                offset: Offset(0, 6),
                blurRadius: 6,
                spreadRadius: -3,
                color: Color.fromRGBO(11, 21, 34, 0.24),
              ),
              BoxShadow(
                offset: Offset(0, 12),
                blurRadius: 12,
                spreadRadius: -6,
                color: Color.fromRGBO(11, 21, 34, 0.32),
              ),
              BoxShadow(
                offset: Offset(0, 24),
                blurRadius: 24,
                spreadRadius: -12,
                color: Color.fromRGBO(11, 21, 34, 0.24),
              ),
              BoxShadow(
                offset: Offset(0, 32),
                blurRadius: 32,
                spreadRadius: -16,
                color: Color.fromRGBO(11, 21, 34, 0.24),
              ),
              BoxShadow(
                inset: true,
                offset: Offset(0, 0.5),
                blurRadius: 0.5,
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
              BoxShadow(
                inset: true,
                offset: Offset(0, 1),
                blurRadius: 2,
                color: Color.fromRGBO(255, 255, 255, 0.32),
              ),
            ],
          ),
          child: CustomPaint(
            painter: _painter,
            willChange: true,
          ),
        ),
      ),
    );
  }
}

/// A widget that sizes [_ButtonOverlay] to a fraction of the total available
/// space, while allowing it to have an [initialWidth].
class _ButtonOverlayExpandingBox extends SingleChildRenderObjectWidget {
  const _ButtonOverlayExpandingBox({
    required this.initialWidth,
    required this.expansionFactor,
    required super.child,
  });

  final double initialWidth;

  final double expansionFactor;

  @override
  _RenderButtonOverlayExpandingBox createRenderObject(BuildContext context) {
    return _RenderButtonOverlayExpandingBox(
      initialWidth: initialWidth,
      expansionFactor: expansionFactor,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderButtonOverlayExpandingBox renderObject,
  ) {
    renderObject
      ..initialWidth = initialWidth
      ..expansionFactor = expansionFactor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<double>('initialWidth', initialWidth))
      ..add(DiagnosticsProperty<double>('expansionFactor', expansionFactor));
  }
}

class _RenderButtonOverlayExpandingBox extends RenderAligningShiftedBox {
  _RenderButtonOverlayExpandingBox({
    required double initialWidth,
    required double expansionFactor,
  }) : assert(
         initialWidth >= 0.0,
         'initialWidth value must not be less then zero',
       ),
       assert(
         expansionFactor >= 0.0 && expansionFactor <= 1.0,
         'expansionFactor value must be in range [0, 1]',
       ),
       _initialWidth = initialWidth,
       _expansionFactor = expansionFactor,
       super(
         alignment: Alignment.centerLeft,
         textDirection: TextDirection.ltr,
       );

  double get initialWidth => _initialWidth;
  double _initialWidth;
  set initialWidth(double value) {
    assert(value >= 0.0, 'initialWidth value must not be less then zero');
    if (_initialWidth == value) {
      return;
    }
    _initialWidth = value;
    markNeedsLayout();
  }

  double get expansionFactor => _expansionFactor;
  double _expansionFactor;
  set expansionFactor(double value) {
    assert(
      value >= 0.0 && value <= 1.0,
      'expansionFactor value must be in range [0, 1]',
    );
    if (_expansionFactor == value) {
      return;
    }
    _expansionFactor = value;
    markNeedsLayout();
  }

  BoxConstraints _getInnerConstraints(BoxConstraints constraints) {
    final double width;

    if (constraints.maxWidth < initialWidth) {
      width = constraints.maxWidth;
    } else {
      width =
          initialWidth +
          (constraints.maxWidth - initialWidth) * _expansionFactor;
    }

    return BoxConstraints(
      minWidth: width,
      maxWidth: width,
      minHeight: constraints.maxHeight,
      maxHeight: constraints.maxHeight,
    );
  }

  @override
  @protected
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final childSize = child!.getDryLayout(_getInnerConstraints(constraints));
    return constraints.constrain(childSize);
  }

  @override
  void performLayout() {
    child!.layout(_getInnerConstraints(constraints), parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('initialWidth', _initialWidth))
      ..add(DoubleProperty('expansionFactor', _expansionFactor));
  }
}

/// A [CustomPainter] which draws arrows to be displayed in [_ButtonOverlay].
class _ArrowsPainter extends CustomPainter {
  _ArrowsPainter({
    required this.gradientTranslation,
    required this.opacity,
  }) : super(repaint: Listenable.merge([gradientTranslation, opacity]));

  final Animation<double> gradientTranslation;

  final Animation<double> opacity;

  static const _circleDiameter = 2.0;
  static const _circlesGap = 1.0;
  static const double _arrowWidth = 4 * _circleDiameter + 3 * _circlesGap;
  static const double _arrowTranslation = _arrowWidth * (19 / 11);
  static const double _arrowsGap = _arrowTranslation - _arrowWidth;

  static const _circleShadow = BoxShadow(
    offset: Offset(0, 0.5),
    blurRadius: 0.75,
    color: Color.fromRGBO(255, 255, 255, 0.75),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;

    canvas.clipRect(rect);

    // The gradient which will be used to paint the central rows of the arrows.
    final centerGradientRect = Rect.fromCenter(
      center: rect.centerLeft,
      width: size.width * 2,
      height: _circleDiameter,
    );
    final centerGradient = LinearGradient(
      colors: _centerGradientColors,
      stops: _centerGradientStops,
      transform: _TranslationGradientTransform(gradientTranslation.value),
    );
    final centerGradientShader = centerGradient.createShader(
      centerGradientRect,
    );

    // The gradient which will be used to paint the inner rows of the arrows.
    final innerGradient = LinearGradient(
      colors: _innerGradientColors,
      stops: _innerGradientStops,
      transform: _TranslationGradientTransform(gradientTranslation.value),
    );
    final innerGradientShader = innerGradient.createShader(centerGradientRect);

    // The gradient which will be used to paint the outer rows of the arrows.
    final outerGradient = LinearGradient(
      colors: _outerGradientColors,
      stops: _outerGradientStops,
      transform: _TranslationGradientTransform(gradientTranslation.value),
    );
    final outerGradientShader = outerGradient.createShader(centerGradientRect);

    final outerRowsPaint = Paint()..shader = outerGradientShader;
    final innerRowsPaint = Paint()..shader = innerGradientShader;
    final centerRowsPaint = Paint()..shader = centerGradientShader;
    final circleShadowPaint = _circleShadow.toPaint();

    final totalCount = (size.width + _arrowsGap) / (_arrowWidth + _arrowsGap);
    final secondaryCount = (totalCount - 1).ceil();

    // Central arrow drawing. This arrow is always visible.
    _drawArrow(
      canvas: canvas,
      index: 0,
      center: center,
      outerRowsPaint: outerRowsPaint,
      innerRowsPaint: innerRowsPaint,
      centerRowPaint: centerRowsPaint,
      circleShadowPaint: circleShadowPaint,
    );

    // The opacity of the paints has to be adjusted according to the [opacity]
    // animation value. This will cause the smooth appearance and disappearance
    // of the remaining arrows.
    outerRowsPaint.color = outerRowsPaint.color.withValues(
      alpha: opacity.value,
    );
    innerRowsPaint.color = innerRowsPaint.color.withValues(
      alpha: opacity.value,
    );
    centerRowsPaint.color = centerRowsPaint.color.withValues(
      alpha: opacity.value,
    );
    circleShadowPaint.color = circleShadowPaint.color.withValues(
      alpha: opacity.value,
    );

    // Remaining arrows drawing.
    for (var i = 1; i <= secondaryCount ~/ 2; i++) {
      _drawArrow(
        canvas: canvas,
        index: -i,
        center: center,
        outerRowsPaint: outerRowsPaint,
        innerRowsPaint: innerRowsPaint,
        centerRowPaint: centerRowsPaint,
        circleShadowPaint: circleShadowPaint,
      );
      _drawArrow(
        canvas: canvas,
        index: i,
        center: center,
        outerRowsPaint: outerRowsPaint,
        innerRowsPaint: innerRowsPaint,
        centerRowPaint: centerRowsPaint,
        circleShadowPaint: circleShadowPaint,
      );
    }
  }

  /// Draws arrow.
  ///
  /// The [index] argument determines the position of the arrow along X-axis.
  /// 0 means the central arrow, -1 means the first arrow to the left from the
  /// center, 1 means the first arrow to the right from the center.
  ///
  /// The [center] argument has to be equal to the center of the canvas.
  void _drawArrow({
    required Canvas canvas,
    required int index,
    required Offset center,
    required Paint outerRowsPaint,
    required Paint innerRowsPaint,
    required Paint centerRowPaint,
    required Paint circleShadowPaint,
  }) {
    final arrowCenter = center.translate(_arrowTranslation * index, 0);
    final anchorCircleCenter = arrowCenter.translate(
      _arrowWidth / 2 - _circleDiameter * 2,
      0,
    );

    const circleTranslation = _circleDiameter + _circlesGap;

    // Center row drawing.
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: Offset.zero,
      paint: centerRowPaint,
      shadowPaint: circleShadowPaint,
    );
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(circleTranslation, 0),
      paint: centerRowPaint,
      shadowPaint: circleShadowPaint,
    );

    // Top inner row drawing.
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(0, -circleTranslation),
      paint: innerRowsPaint,
      shadowPaint: circleShadowPaint,
    );
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation, -circleTranslation),
      paint: innerRowsPaint,
      shadowPaint: circleShadowPaint,
    );

    // Top outer row drawing.
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation, -circleTranslation * 2),
      paint: outerRowsPaint,
      shadowPaint: circleShadowPaint,
    );
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation * 2, -circleTranslation * 2),
      paint: outerRowsPaint,
      shadowPaint: circleShadowPaint,
    );

    // Bottom inner row drawing.
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(0, circleTranslation),
      paint: innerRowsPaint,
      shadowPaint: circleShadowPaint,
    );
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation, circleTranslation),
      paint: innerRowsPaint,
      shadowPaint: circleShadowPaint,
    );

    // Bottom outer row drawing.
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation, circleTranslation * 2),
      paint: outerRowsPaint,
      shadowPaint: circleShadowPaint,
    );
    _drawCircle(
      canvas: canvas,
      anchorCircleCenter: anchorCircleCenter,
      offset: const Offset(-circleTranslation * 2, circleTranslation * 2),
      paint: outerRowsPaint,
      shadowPaint: circleShadowPaint,
    );
  }

  /// Draws single circle of the arrow.
  void _drawCircle({
    required Canvas canvas,
    required Offset anchorCircleCenter,
    required Offset offset,
    required Paint paint,
    required Paint shadowPaint,
  }) {
    final circleRect = Rect.fromCenter(
      center: anchorCircleCenter.translate(offset.dx, offset.dy),
      width: _circleDiameter,
      height: _circleDiameter,
    );
    final shadowRect = circleRect
        .shift(_circleShadow.offset)
        .inflate(_circleShadow.spreadRadius);

    // First, we need to draw a shadow and then the circle itself.
    canvas
      ..drawOval(shadowRect, shadowPaint)
      ..drawOval(circleRect, paint);
  }

  @override
  bool shouldRepaint(_ArrowsPainter oldDelegate) => false;
}

/// A [GradientTransform] that translates the gradient along the X-axis.
class _TranslationGradientTransform extends GradientTransform {
  const _TranslationGradientTransform(this.dx);

  final double dx;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * dx, 0, 0);
  }
}
