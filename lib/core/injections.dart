import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:http/http.dart' as http;

final httpClientProvider = Provider<http.Client>((ref) => http.Client());
