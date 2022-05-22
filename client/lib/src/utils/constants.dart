import 'dart:io';

import 'package:flutter/foundation.dart';

final gqlUrl = kIsWeb
    ? 'http://127.0.0.1:8000/graphql/'
    : Platform.isAndroid
        ? 'http://10.0.2.2:8000/graphql/'
        : 'http://127.0.0.1:8000/graphql/';
