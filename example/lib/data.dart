import 'package:chatview2/chatview2.dart';

class Data {
  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";
  static final messageList = [
    Message(
      id: '1',
      title: "1",
      message: "Hi!",
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.delivered,
    ),
    Message(
      id: '2',
      title: "1",
      message: "Hi!",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '3',
      title: "1",
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '4',
      title: "1",
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '5',
      title: "1",
      message: "That's fine",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
      status: MessageStatus.read,
    ),
    Message(
      id: '6',
      title: "1",
      message: "When to go ?",
      createdAt: DateTime.now(),
      sendBy: '3',
      status: MessageStatus.read,
    ),
    Message(
      id: '7',
      title: "1",
      message: "I guess Simform will reply",
      createdAt: DateTime.now(),
      sendBy: '4',
      status: MessageStatus.read,
    ),
    Message(
      id: '8',
      title: "1",
      message: "https://goo.gl/maps/Vjqt8BtsCVkfH7m69",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{1F44D}', '\u{1F44D}'],
        reactedUserIds: ['2', '3', '4'],
      ),
      status: MessageStatus.read,
      replyMessage: const ReplyMessage(
        message: "Can you write the time and place of the meeting?",
        replyTo: '1',
        replyBy: '2',
        messageId: '4',
      ),
    ),
    Message(
      id: '9',
      title: "1",
      message: "Done",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
      reaction: Reaction(
        reactions: [
          '\u{2764}',
          '\u{2764}',
          '\u{2764}',
        ],
        reactedUserIds: ['2', '3', '4'],
      ),
    ),
    Message(
      id: '10',
      title: "1",
      message: "Thank you!!",
      status: MessageStatus.read,
      createdAt: DateTime.now(),
      sendBy: '1',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{2764}', '\u{2764}', '\u{2764}'],
        reactedUserIds: ['2', '4', '3', '1'],
      ),
    ),
    Message(
      id: '11',
      title: "1",
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: '1',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['2']),
      status: MessageStatus.read,
    ),
    Message(
      id: '31',
      title: "1",
      fileName: "1.txt",
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.file,
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '12',
      title: "1",
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
  ];
}
