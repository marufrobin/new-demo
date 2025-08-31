import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/constant/constant_variable.dart';

class CommonDropDownMenuItemsModel {
  final String value;
  final String items;

  CommonDropDownMenuItemsModel({required this.value, required this.items});
}

class AppSearchableDropDownWidget extends StatefulWidget {
  const AppSearchableDropDownWidget({
    super.key,
    required this.listOfDropDownMenuItems,
    required this.onChanged,
    this.selectedValue,
    this.hintText,
    this.textEditingController,
  });

  final List<CommonDropDownMenuItemsModel> listOfDropDownMenuItems;
  final void Function(String? value)? onChanged;
  final String? selectedValue;
  final String? hintText;
  final TextEditingController? textEditingController;

  @override
  State<AppSearchableDropDownWidget> createState() =>
      _AppSearchableDropDownWidgetState();
}

class _AppSearchableDropDownWidgetState
    extends State<AppSearchableDropDownWidget> {
  String? selectedValue;

  TextEditingController? textEditingController;

  String? hintText;

  @override
  void initState() {
    selectedValue = widget.selectedValue;
    hintText = widget.hintText;
    textEditingController = widget.textEditingController;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: _hintText(theme),
        items: widget.listOfDropDownMenuItems
            .map((element) => DropdownMenuItem(
                  value: element.items,
                  child: Text(
                    element.items,
                    style: TextStyle(
                      fontSize: 16.r,
                      color: theme.colorScheme.onSurface,
                      fontWeight: selectedValue == element.value
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                ))
            .toList(),

        value: selectedValue,
        onChanged: (value) {
          setState(() => selectedValue = value);
          widget.onChanged?.call(value);
        },
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.only(right: 16.r),
            height: 50.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.1.r),
              borderRadius:
                  BorderRadius.circular(AppConstantVariable.kRadius.r),
            )
            // width: 200.w,
            ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 260.w,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(height: 50.h),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50.r,
          searchInnerWidget: _searchInnerWidget(theme),
          searchMatchFn: (item, searchValue) =>
              item.value.toString().contains(searchValue),
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController?.clear();
          }
        },
      ),
    );
  }

  Text _hintText(ThemeData theme) {
    return Text(
      hintText ?? 'Select Item',
      style: TextStyle(
        fontWeight: theme.textTheme.bodySmall?.fontWeight,
        fontSize: 16.r,
        color: theme.colorScheme.onSurface.withOpacity(0.6.r),
      ),
    );
  }

  Container _searchInnerWidget(ThemeData theme) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.all(8.r),
      child: TextFormField(
        expands: true,
        maxLines: null,
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          hintText: 'Search for an item...',
          hintStyle: TextStyle(
            fontWeight: theme.textTheme.bodySmall?.fontWeight,
            fontSize: 16.r,
            color: theme.colorScheme.onSurface.withOpacity(0.6.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppConstantVariable.kRadius.r,
            ),
          ),
        ),
      ),
    );
  }
}
