import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/widget/button_widget/app_icon_button.widget.dart';
import '../../../core/common/widget/income_overlay.widget.dart';
import '../../../core/config/app.routes.dart';
import '../../../core/utils/app_currency_symbol_on_price.dart';
import '../../account/bloc/user_bloc/user_bloc.dart';
import '../../dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // color: Colors.red,
      color: Colors.transparent,
      child: Column(
        children: [
          (height * 0.4).verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.horizontalSpace,
              AppIconButton(
                onPressed: () async {
                  context.pushNamed(AppRoutesNames.accountScreen);

                  // final token = await FirebaseMessaging.instance.getToken();
                  //
                  // log(token.toString(), name: "token");
                },
                icon: const Icon(Icons.menu),
              ),
              Transform.translate(
                offset: Offset(0, 50.r),
                child: BlocBuilder<OverAllReportBloc, OverAllReportState>(
                  builder: (overAllReportContext, overAllReportState) {
                    return BlocBuilder<UserBloc, UserState>(
                      builder: (userContext, userState) {
                        return IncomeOverLayWidget(
                          rating: "0",
                          todayIncome: AppCurrencySymbolOnPrice()
                              .getCurrencySymbolPlaceholder(
                                moneyAmount:
                                    overAllReportState
                                            is TodayOverAllReportState
                                        ? overAllReportState
                                            .todayOverAllReport
                                            ?.totalIncome
                                        : 0,
                              ),
                          profileImageURL:
                              userState is UserData
                                  ? userState.userModel?.avatar?.key
                                  : "",
                        );
                      },
                    );
                  },
                ),
              ),
              AppIconButton(
                onPressed: () {
                  context.pushNamed(AppRoutesNames.helpScreen);
                },
                icon: const Icon(Icons.question_mark_outlined),
              ),
              2.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
