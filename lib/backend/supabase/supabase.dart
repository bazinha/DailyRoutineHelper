import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://zdszdjowrdwzwctxzmve.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpkc3pkam93cmR3endjdHh6bXZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMDA1ODUsImV4cCI6MjAwNjY3NjU4NX0.51JPUvGiu_uZuxRyQgPGcTsXo5v3_GuPYPDa8fsXh1M';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
