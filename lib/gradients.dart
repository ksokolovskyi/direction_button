part of 'button.dart';

const _outerGradientColors = <Color>[
  Color.fromRGBO(13, 21, 33, 0.02),
  Color.fromRGBO(13, 21, 33, 0.12),
  Color.fromRGBO(32, 38, 50, 0.26),
  Color.fromRGBO(13, 21, 33, 0.33),
  Color.fromRGBO(46, 52, 62, 0.28),
  Color.fromRGBO(13, 21, 33, 0.56),
  Color.fromRGBO(13, 21, 33, 0.84),
  Color.fromRGBO(32, 38, 50, 0.87),
  Color.fromRGBO(13, 21, 33, 0.75),
  Color.fromRGBO(13, 21, 33, 0.69),
  Color.fromRGBO(32, 38, 50, 0.42),
  Color.fromRGBO(13, 21, 33, 0.34),
  Color.fromRGBO(32, 38, 50, 0.29),
  Color.fromRGBO(32, 38, 50, 0.26),
  Color.fromRGBO(13, 21, 33, 0.02),
  Color.fromRGBO(13, 21, 33, 0.02),
  Color.fromRGBO(13, 21, 33, 0.12),
  Color.fromRGBO(32, 38, 50, 0.26),
  Color.fromRGBO(13, 21, 33, 0.33),
  Color.fromRGBO(46, 52, 62, 0.28),
  Color.fromRGBO(13, 21, 33, 0.56),
  Color.fromRGBO(13, 21, 33, 0.84),
  Color.fromRGBO(32, 38, 50, 0.87),
  Color.fromRGBO(13, 21, 33, 0.75),
  Color.fromRGBO(13, 21, 33, 0.69),
  Color.fromRGBO(32, 38, 50, 0.42),
  Color.fromRGBO(13, 21, 33, 0.34),
  Color.fromRGBO(32, 38, 50, 0.29),
  Color.fromRGBO(32, 38, 50, 0.26),
  Color.fromRGBO(13, 21, 33, 0.02),
];

const _outerGradientStops = <double>[
  0.00405,
  0.0161,
  0.08005,
  0.092,
  0.1561,
  0.16805,
  0.232,
  0.244,
  0.30815,
  0.31995,
  0.3839,
  0.3959,
  0.46,
  0.4719,
  0.5,
  0.50405,
  0.5161,
  0.58005,
  0.592,
  0.6561,
  0.66805,
  0.723,
  0.744,
  0.80815,
  0.81995,
  0.8839,
  0.8959,
  0.96,
  0.9719,
  1,
];

const _innerGradientColors = <Color>[
  Color.fromRGBO(13, 21, 33, 0.02),
  Color.fromRGBO(13, 21, 33, 0.16),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.35),
  Color.fromRGBO(32, 38, 50, 0.42),
  Color.fromRGBO(12, 26, 33, 0.58),
  Color.fromRGBO(32, 38, 50, 0.67),
  Color.fromRGBO(32, 38, 50, 0.87),
  Color.fromRGBO(13, 21, 33, 0.95),
  Color.fromRGBO(13, 21, 33, 0.55),
  Color.fromRGBO(32, 38, 50, 0.46),
  Color.fromRGBO(13, 21, 33, 0.32),
  Color.fromRGBO(13, 21, 33, 0.23),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.20),
  Color.fromRGBO(13, 21, 33, 0.02),
  Color.fromRGBO(13, 21, 33, 0.16),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.35),
  Color.fromRGBO(32, 38, 50, 0.42),
  Color.fromRGBO(12, 26, 33, 0.58),
  Color.fromRGBO(32, 38, 50, 0.67),
  Color.fromRGBO(32, 38, 50, 0.87),
  Color.fromRGBO(13, 21, 33, 0.95),
  Color.fromRGBO(13, 21, 33, 0.55),
  Color.fromRGBO(32, 38, 50, 0.46),
  Color.fromRGBO(13, 21, 33, 0.32),
  Color.fromRGBO(13, 21, 33, 0.23),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.20),
  Color.fromRGBO(13, 21, 33, 0.02),
];

const _innerGradientStops = <double>[
  0,
  0.01595,
  0.0279,
  0.09195,
  0.10415,
  0.16795,
  0.1801,
  0.24405,
  0.2559,
  0.3199,
  0.3319,
  0.39595,
  0.40805,
  0.4721,
  0.4838,
  0.5,
  0.51595,
  0.5279,
  0.59195,
  0.60415,
  0.66795,
  0.6801,
  0.74405,
  0.7559,
  0.8199,
  0.8319,
  0.89595,
  0.9805,
  0.9721,
  0.9838,
  1,
];

const _centerGradientColors = <Color>[
  Color.fromRGBO(13, 21, 33, 0.05),
  Color.fromRGBO(13, 21, 33, 0.28),
  Color.fromRGBO(32, 38, 50, 0.29),
  Color.fromRGBO(13, 21, 33, 0.48),
  Color.fromRGBO(32, 38, 50, 0.49),
  Color.fromRGBO(13, 21, 33, 0.68),
  Color.fromRGBO(32, 38, 50, 0.76),
  Color(0xFF202632),
  Color(0xFF202632),
  Color.fromRGBO(32, 38, 50, 0.40),
  Color.fromRGBO(32, 38, 50, 0.40),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.08),
  Color.fromRGBO(13, 21, 33, 0.05),
  Color.fromRGBO(13, 21, 33, 0.05),
  Color.fromRGBO(13, 21, 33, 0.28),
  Color.fromRGBO(32, 38, 50, 0.29),
  Color.fromRGBO(13, 21, 33, 0.48),
  Color.fromRGBO(32, 38, 50, 0.49),
  Color.fromRGBO(13, 21, 33, 0.68),
  Color.fromRGBO(32, 38, 50, 0.76),
  Color(0xFF202632),
  Color(0xFF202632),
  Color.fromRGBO(32, 38, 50, 0.40),
  Color.fromRGBO(32, 38, 50, 0.40),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(32, 38, 50, 0.22),
  Color.fromRGBO(13, 21, 33, 0.08),
  Color.fromRGBO(13, 21, 33, 0.05),
];

const _centerGradientStops = <double>[
  0,
  0.0279,
  0.04,
  0.104,
  0.1161,
  0.17995,
  0.1919,
  0.25595,
  0.268,
  0.3322,
  0.3442,
  0.408,
  0.42,
  0.48405,
  0.4962,
  0.5,
  0.5279,
  0.54,
  0.604,
  0.6161,
  0.67995,
  0.6919,
  0.75595,
  0.768,
  0.8322,
  0.8442,
  0.908,
  0.92,
  0.98405,
  0.9962,
];