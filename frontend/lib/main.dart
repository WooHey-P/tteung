import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/env_config.dart';
import 'core/config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경변수 로드
  await EnvConfig.load();

  // Supabase 초기화
  await SupabaseConfig.initialize();

  runApp(
    const ProviderScope(
      child: TteungApp(),
    ),
  );
}
