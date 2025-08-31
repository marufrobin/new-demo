import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant_variable.dart';
import 'app_searchable_drop_down_menu.widget.dart';

class AppDropDownMenuWidget extends StatelessWidget {
  const AppDropDownMenuWidget({
    super.key,
    required this.listOfDropDownMenuItems,
    required this.onChanged,
    this.value,
    this.hintText = 'Select Item',
    this.textEditingController,
    this.isExpanded = true,
  });

  final List<CommonDropDownMenuItemsModel> listOfDropDownMenuItems;
  final void Function(String? value)? onChanged;
  final String? value;
  final String hintText;
  final TextEditingController? textEditingController;

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<DropdownMenuItem> listDropdown =
        listOfDropDownMenuItems
            .map(
              (element) => DropdownMenuItem(
                value: element.value,
                child: Text(
                  element.items,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 16.r,
                    fontWeight:
                        value == element.value
                            ? FontWeight.w800
                            : FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList();
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: isExpanded,
        value: value,
        items: listDropdown.cast<DropdownMenuItem<String>>(),
        hint: Text(
          hintText,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 16.r,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6.r),
          ),
        ),
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 16.r,
          fontWeight: FontWeight.w500,
        ),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 16.r),
          height: 50.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1.r),
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down),
          openMenuIcon: Icon(Icons.arrow_drop_up),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
        ),
      ),
    );
  }
}
