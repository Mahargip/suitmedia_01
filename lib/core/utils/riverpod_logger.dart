
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonStateLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    if (newValue is AsyncData<Uint8List>) return;
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''', name: 'Common State Logger');
  }
}
