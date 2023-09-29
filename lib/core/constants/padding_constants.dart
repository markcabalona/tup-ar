import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';

/// ```
/// PaddingConstants.horizontal = 16.0
/// PaddingConstants.horizontalMedium = 24.0
/// PaddingConstants.horizontalLarge = 32.0
///
/// PaddingConstants.vertical = 8.0
/// PaddingConstants.verticalMedium = 16.0
/// PaddingConstants.verticalLarge = 24.0
///
/// PaddingConstants.all = 8.0
/// PaddingConstants.allMedium = 16.0
/// PaddingConstants.allLarge = 24.0
/// ```
abstract class PaddingConstants {
  static const horizontal = EdgeInsets.symmetric(
    horizontal: GridConstants.medium,
  );

  static const mediumHorizontal = EdgeInsets.symmetric(
    horizontal: GridConstants.large,
  );

  static const largeHorizontal = EdgeInsets.symmetric(
    horizontal: GridConstants.xLarge,
  );

  static const vertical = EdgeInsets.symmetric(
    vertical: GridConstants.small,
  );

  static const mediumVertical = EdgeInsets.symmetric(
    vertical: GridConstants.medium,
  );

  static const largeVertical = EdgeInsets.symmetric(
    vertical: GridConstants.large,
  );

  static const all = EdgeInsets.all(
    GridConstants.small,
  );
  static const mediumAll = EdgeInsets.all(
    GridConstants.medium,
  );
  static const largeAll = EdgeInsets.all(
    GridConstants.large,
  );
}
