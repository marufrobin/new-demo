import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_text_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';

import '../../../../core/utils/close_keyboard.dart';
import '../../bloc/support_message_bloc/support_message_bloc.dart';

class UpdateMessageScreen extends StatefulWidget {
  const UpdateMessageScreen({
    required this.threadId,
    required this.messageId,
    required this.message,
    super.key,
  });

  final String threadId;
  final String messageId;
  final String message;

  @override
  State<UpdateMessageScreen> createState() => _UpdateMessageScreenState();
}

class _UpdateMessageScreenState extends State<UpdateMessageScreen> {
  bool isLoading = false;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    messageController.text = widget.message;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          // color: ColorPallet.kWhiteColor,
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Update Message", style: theme.textTheme.titleMedium),
              16.verticalSpace,
              AppTextField(
                controller: messageController,
                hintText: "Write your request here..",
              ),
              30.verticalSpace,
              BlocConsumer<SupportMessageBloc, SupportMessageState>(
                listener: (context, state) {
                  if (state is UpdateSupportMessageSuccess) {
                    state.isSuccess ?? false ? context.pop() : null;
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    onPressed: () async {
                      closeKeyboardOnClick();
                      context.read<SupportMessageBloc>().add(
                        UpdateSupportMessageEvent(
                          messageId: widget.messageId,
                          threadId: widget.threadId,
                          body: messageController.text.trim(),
                        ),
                      );
                    },
                    buttonLabel: "Update",
                    isLoading: state is UpdateSupportMessageLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
