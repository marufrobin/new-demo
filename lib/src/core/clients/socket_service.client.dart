import 'dart:async';
import 'dart:developer';

import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/model/support_message.model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  SocketService._internal();

  late IO.Socket socket;
  final StreamController<SupportMessageModel?> _messageStreamController =
      StreamController.broadcast();

  Future<IO.Socket> initConnection() async {
    socket = IO.io(
      AppUrlsConfiguration.socketUrl,
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    if (socket.connected) {
      log("✅ Socket already Connected ✅");
    } else {
      socket.connect();
    }

    log("Trying Connecting....${socket.connected}");
    socket.onConnect((data) => log("✅ Socket Connected ✅"));
    socket.onError((data) => log("Error on $data"));
    socket.onDisconnect((data) => log("❌ socket disconnected: $data"));

    return socket;
  }

  /// Join Rider onBoarding Invitation room
  Future<void> joinRiderOnBoardingInvitationRoom() async {
    await initConnection();
    log("Joined room ", name: "Socket connected: ${socket.connected}");
    socket.emit("emit:rider-onboarding:join-room");
  }

  /// Leave Rider onBoarding Invitation room
  Future<void> leaveRiderOnBoardingInvitationRoom() async {
    await initConnection();
    log("Leave room ", name: "Socket connected: ${socket.connected}");
    socket.emit("emit:rider-onboarding:leave-room");
  }

  /// Join a thread room
  void joinRoom(String threadId) {
    socket.emit("emit:support-thread:join-room", {'threadId': threadId});
    log("Joined room with thread ID: $threadId");

    socket.on('listen:support-thread:$threadId:messages', (data) {
      SupportMessageModel? message = SupportMessageModel.fromJson(data);
      _messageStreamController.add(message);
    });
  }

  /// Leave a thread room
  void leaveRoom(String threadId) {
    socket.emit("emit:support-thread:leave-room", {'threadId': threadId});
    socket.off('listen:support-thread:$threadId:messages');
    log("Left room with thread ID: $threadId");
  }

  /// Send a message to a thread
  void sendMessage({
    required String? threadId,
    required String? message,
    required String? userId,
  }) {
    socket.emit("emit:support-thread:send-message", {
      'threadId': threadId,
      'body': message,
      'userId': userId,
    });
    log("Message sent to thread ID: $threadId");
  }

  /// Dispose the socket connection
  void dispose() => _messageStreamController.close();

  Stream<SupportMessageModel?> get messageStream =>
      _messageStreamController.stream;
}
