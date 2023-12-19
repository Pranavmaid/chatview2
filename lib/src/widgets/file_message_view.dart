/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:chatview2/chatview2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/constants/constants.dart';

class FileMessageView extends StatelessWidget {
  const FileMessageView({
    Key? key,
    required this.isMessageBySender,
    required this.message,
    this.chatBubbleMaxWidth,
    this.inComingChatBubbleConfig,
    this.outgoingChatBubbleConfig,
    this.messageReactionConfig,
    this.highlightMessage = false,
    this.highlightColor,
  }) : super(key: key);

  /// Represents current message is sent by current user.
  final bool isMessageBySender;

  /// Provides message instance of chat.
  final Message message;

  /// Allow users to give max width of chat bubble.
  final double? chatBubbleMaxWidth;

  /// Provides configuration of chat bubble appearance from other user of chat.
  final ChatBubble? inComingChatBubbleConfig;

  /// Provides configuration of chat bubble appearance from current user of chat.
  final ChatBubble? outgoingChatBubbleConfig;

  /// Provides configuration of reaction appearance in chat bubble.
  final MessageReactionConfiguration? messageReactionConfig;

  /// Represents message should highlight.
  final bool highlightMessage;

  /// Allow user to set color of highlighted message.
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: BoxConstraints(
          maxWidth:
              chatBubbleMaxWidth ?? MediaQuery.of(context).size.width * 0.75),
      padding: _padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
      margin: _margin ?? const EdgeInsets.fromLTRB(5, 0, 6, 2),
      decoration: BoxDecoration(
        color: highlightMessage ? highlightColor : _color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 70, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          message.fileName,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: _textStyle ??
                              textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _onDownloadTap!(message) ?? () {};
                          },
                          icon: _iconStyle ??
                              Icon(
                                Icons.file_download_outlined,
                                color: _textStyle != null
                                    ? _textStyle!.color ?? Colors.white
                                    : Colors.white,
                              ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: 70,
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SelectableText(
                            DateFormat().add_jm().format(message.createdAt),
                            cursorColor: Colors.red,
                            showCursor: true,
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: _textStyle != null
                                    ? _textStyle!.color ?? Colors.black
                                    : Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                          child: Icon(
                            message.status == MessageStatus.sent
                                ? Icons.done
                                : message.status == MessageStatus.read
                                    ? Icons.done_all_rounded
                                    : message.status == MessageStatus.delivered
                                        ? Icons.done_all_rounded
                                        : message.status ==
                                                MessageStatus.pending
                                            ? Icons.pending
                                            : message.status ==
                                                    MessageStatus.undelivered
                                                ? Icons.error_outline
                                                : Icons.error_outline,
                            size: 16,
                            color: message.status == MessageStatus.read
                                ? Colors.lightBlueAccent
                                : message.status == MessageStatus.undelivered
                                    ? Colors.amberAccent
                                    : _textStyle != null
                                        ? _textStyle!.color ?? Colors.black
                                        : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  EdgeInsetsGeometry? get _padding => isMessageBySender
      ? outgoingChatBubbleConfig?.padding
      : inComingChatBubbleConfig?.padding;

  EdgeInsetsGeometry? get _margin => isMessageBySender
      ? outgoingChatBubbleConfig?.margin
      : inComingChatBubbleConfig?.margin;

  LinkPreviewConfiguration? get _linkPreviewConfig => isMessageBySender
      ? outgoingChatBubbleConfig?.linkPreviewConfig
      : inComingChatBubbleConfig?.linkPreviewConfig;

  TextStyle? get _textStyle => isMessageBySender
      ? outgoingChatBubbleConfig?.textStyle
      : inComingChatBubbleConfig?.textStyle;

  Icon? get _iconStyle => isMessageBySender
      ? outgoingChatBubbleConfig?.downloadIcon
      : inComingChatBubbleConfig?.downloadIcon;

  Function(Message)? get _onDownloadTap => isMessageBySender
      ? outgoingChatBubbleConfig?.onDownloadTap
      : inComingChatBubbleConfig?.onDownloadTap;

  BorderRadiusGeometry _borderRadius(String message) => isMessageBySender
      ? outgoingChatBubbleConfig?.borderRadius ??
          (message.length < 37
              ? BorderRadius.circular(replyBorderRadius1)
              : BorderRadius.circular(replyBorderRadius2))
      : inComingChatBubbleConfig?.borderRadius ??
          (message.length < 29
              ? BorderRadius.circular(replyBorderRadius1)
              : BorderRadius.circular(replyBorderRadius2));

  Color get _color => isMessageBySender
      ? outgoingChatBubbleConfig?.color ?? Colors.purple
      : inComingChatBubbleConfig?.color ?? Colors.grey.shade500;
}
