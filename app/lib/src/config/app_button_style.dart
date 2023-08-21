// ignore_for_file: constant_identifier_names, unused_element
part of 'app_theme.dart';

class AppButtonStyle {
  static ButtonStyle? get filledButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppThemeExt.of.majorScale(10 / 4),
            ),
          ),
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.grayColor[100],
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.primaryColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.primaryColor[600],
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.grayColor[100],
        ),
      );

  static ButtonStyle? get filledButtonDangerStyle =>
      filledButtonStyle?.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.redColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.redColor[600],
        ),
      );

  static ButtonStyle? get textButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppThemeExt.of.majorScale(10 / 4),
            ),
          ),
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.primaryColor;
          },
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.primaryColor;
          },
        ),
      );

  static ButtonStyle? get textButtonDangerStyle => textButtonStyle?.copyWith(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.redColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.redColor;
          },
        ),
      );

  static ButtonStyle? get outlinedButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppThemeExt.of.majorScale(10 / 4),
            ),
          ),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.hovered)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppColors.of.grayColor[300]!);
            }
            return BorderSide(color: AppColors.of.grayColor[400]!);
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.grayColor;
          },
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.white,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.grayColor;
          },
        ),
      );

  static ButtonStyle? get outlinedButtonDangerStyle =>
      outlinedButtonStyle?.copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return BorderSide(color: AppColors.of.redColor[600]!);
            }
            if (states.contains(MaterialState.hovered)) {
              return BorderSide(color: AppColors.of.redColor[600]!);
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(color: AppColors.of.redColor[600]!);
            }
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppColors.of.grayColor[300]!);
            }
            return BorderSide(color: AppColors.of.redColor);
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.redColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.redColor[600];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.grayColor[500];
            }
            return AppColors.of.redColor;
          },
        ),
      );
}
