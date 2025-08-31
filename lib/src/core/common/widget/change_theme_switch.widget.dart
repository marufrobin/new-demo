import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rider/src/core/common/widget/app_drop_down_menu.widget.dart';
import 'package:rider/src/core/theme/cubit/theme_cubit.dart';

import 'app_searchable_drop_down_menu.widget.dart';

// class ChangeTheme extends StatefulWidget {
//   const ChangeTheme({super.key});
//
//   @override
//   State<ChangeTheme> createState() => _ChangeThemeState();
// }
//
// class _ChangeThemeState extends State<ChangeTheme> {
//   // bool _isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return SizedBox(
//       height: 42.r,
//       width: 52.r,
//       child: FittedBox(
//         fit: BoxFit.fill,
//         child: BlocBuilder<ThemeCubit, ThemeMode>(
//           builder: (context, state) {
//             return Switch(
//               value: state == ThemeMode.dark,
//               thumbIcon: _thumbIcon(state == ThemeMode.dark),
//               inactiveThumbColor: theme.colorScheme.surface,
//               inactiveTrackColor:
//                   theme.colorScheme.onSurface.withValues(alpha: 0.5),
//               activeColor: theme.colorScheme.surface,
//               activeTrackColor:
//                   theme.colorScheme.onSurface.withValues(alpha: 0.5),
//               trackOutlineColor:
//                   const WidgetStatePropertyAll(Colors.transparent),
//               onChanged: (value) {
//                 context.read<ThemeCubit>().changeTheme(isDark: value);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   WidgetStatePropertyAll<Icon?> _thumbIcon(bool isDark) {
//     return WidgetStatePropertyAll(Icon(
//       isDark ? Icons.dark_mode : Icons.light_mode,
//       color: isDark ? Colors.white : Colors.black,
//     ));
//   }
// }
class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommonDropDownMenuItemsModel> _listOfDropDownMenuItems = [
      CommonDropDownMenuItemsModel(
        value: "1",
        items: 'Dark',
      ),
      CommonDropDownMenuItemsModel(
        value: "2",
        items: 'Light',
      ),
      CommonDropDownMenuItemsModel(
        value: "3",
        items: 'System',
      ),
    ];
    return SizedBox(
      // height: 42.r,
      // width: 52.r,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return AppDropDownMenuWidget(
            isExpanded: false,
            listOfDropDownMenuItems: _listOfDropDownMenuItems,
            value: state == ThemeMode.dark
                ? "1"
                : state == ThemeMode.light
                    ? "2"
                    : "3",
            onChanged: (value) {
              final themeMode = value == "1"
                  ? ThemeMode.dark
                  : value == "2"
                      ? ThemeMode.light
                      : ThemeMode.system;
              context.read<ThemeCubit>().changeTheme(themeMode: themeMode);
            },
          );
        },
      ),
    );
  }
}
