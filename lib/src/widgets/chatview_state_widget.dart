import 'package:chatview2/chatview2.dart';
import 'package:chatview2/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ChatViewStateWidget extends StatelessWidget {
  const ChatViewStateWidget({
    Key? key,
    this.chatViewStateWidgetConfig,
    required this.chatViewState,
    this.onReloadButtonTap,
  }) : super(key: key);

  /// Provides configuration of chat view's different states such as text styles,
  /// widgets and etc.
  final ChatViewStateWidgetConfiguration? chatViewStateWidgetConfig;

  /// Provides current state of chat view.
  final ChatViewState chatViewState;

  /// Provides callback when user taps on reload button in error and no messages
  /// state.
  final VoidCallBack? onReloadButtonTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: chatViewStateWidgetConfig?.widget ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                (chatViewStateWidgetConfig?.title
                    .getChatViewStateTitle(chatViewState))!,
                cursorColor: Colors.red,
                showCursor: true,
                toolbarOptions: ToolbarOptions(
                    copy: true, selectAll: true, cut: false, paste: false),
                style: chatViewStateWidgetConfig?.titleTextStyle ??
                    const TextStyle(
                      fontSize: 22,
                    ),
              ),
              if (chatViewStateWidgetConfig?.subTitle != null)
                SelectableText(
                  (chatViewStateWidgetConfig?.subTitle)!,
                  cursorColor: Colors.red,
                  showCursor: true,
                  toolbarOptions: ToolbarOptions(
                      copy: true, selectAll: true, cut: false, paste: false),
                  style: chatViewStateWidgetConfig?.subTitleTextStyle,
                ),
              if (chatViewState.isLoading)
                CircularProgressIndicator(
                  color: chatViewStateWidgetConfig?.loadingIndicatorColor,
                ),
              if (chatViewStateWidgetConfig?.imageWidget != null)
                (chatViewStateWidgetConfig?.imageWidget)!,
              if (chatViewStateWidgetConfig?.reloadButton != null)
                (chatViewStateWidgetConfig?.reloadButton)!,
              if (chatViewStateWidgetConfig != null &&
                  (chatViewStateWidgetConfig?.showDefaultReloadButton)! &&
                  chatViewStateWidgetConfig?.reloadButton == null &&
                  (chatViewState.isError || chatViewState.noMessages)) ...[
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onReloadButtonTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        chatViewStateWidgetConfig?.reloadButtonColor ??
                            const Color(0xffEE5366),
                  ),
                  child: const SelectableText(
                    'Reload',
                    cursorColor: Colors.red,
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(
                        copy: true, selectAll: true, cut: false, paste: false),
                  ),
                )
              ]
            ],
          ),
    );
  }
}
