import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';

/// ```
/// SpacerConstants.horizontal = 16.0
/// SpacerConstants.horizontalMedium = 24.0
/// SpacerConstants.horizontalLarge = 32.0
///
/// SpacerConstants.vertical = 8.0
/// SpacerConstants.verticalMedium = 16.0
/// SpacerConstants.verticalLarge = 24.0
/// ```
abstract class SpacerConstants {
  static const horizontal = SizedBox(
    width: GridConstants.medium,
  );

  static const mediumHorizontal = SizedBox(
    width: GridConstants.large,
  );

  static const largeHorizontal = SizedBox(
    width: GridConstants.xLarge,
  );

  static const vertical = SizedBox(
    height: GridConstants.small,
  );

  static const mediumVertical = SizedBox(
    height: GridConstants.medium,
  );

  static const largeVertical = SizedBox(
    height: GridConstants.large,
  );
}
