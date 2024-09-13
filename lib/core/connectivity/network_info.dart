import "dart:async";
import "dart:io";

import "package:flutter/foundation.dart";

part "internet_connection_checker.dart";

sealed class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;

  Stream<InternetConnectionStatus> get onStatusChange;
}

@immutable
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.internetConnection);

  final InternetConnectionChecker internetConnection;

  @override
  Future<bool> get isConnected => internetConnection.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      internetConnection.onStatusChange;

  @override
  String toString() => "NetworkInfoImpl($internetConnection)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NetworkInfoImpl &&
        other.internetConnection == internetConnection;
  }

  @override
  int get hashCode => internetConnection.hashCode;
}
