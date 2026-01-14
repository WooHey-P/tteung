import 'package:supabase_flutter/supabase_flutter.dart';

import 'env_config.dart';

/// Supabase 클라이언트 설정 클래스
class SupabaseConfig {
  SupabaseConfig._();

  static SupabaseClient? _client;

  /// Supabase 초기화
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
    );
    _client = Supabase.instance.client;
  }

  /// Supabase 클라이언트 싱글톤
  static SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase가 초기화되지 않았습니다. SupabaseConfig.initialize()를 먼저 호출하세요.');
    }
    return _client!;
  }

  /// 현재 인증된 사용자
  static User? get currentUser => client.auth.currentUser;

  /// 인증 상태 변경 스트림
  static Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
}
