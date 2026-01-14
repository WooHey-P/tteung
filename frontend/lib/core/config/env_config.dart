import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 환경변수 설정 클래스
class EnvConfig {
  EnvConfig._();

  /// 환경변수 로드
  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }

  /// Supabase URL
  static String get supabaseUrl {
    final url = dotenv.env['SUPABASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception('SUPABASE_URL이 설정되지 않았습니다.');
    }
    return url;
  }

  /// Supabase Anon Key
  static String get supabaseAnonKey {
    final key = dotenv.env['SUPABASE_ANON_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('SUPABASE_ANON_KEY가 설정되지 않았습니다.');
    }
    return key;
  }
}
