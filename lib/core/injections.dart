import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:http/http.dart' as http;

import 'network_info.dart';

final httpClientProvider = Provider<http.Client>((ref) => http.Client());
final networkInfoProvider = Provider((ref) => NetworkInfoImpl(connectivity: Connectivity()));
