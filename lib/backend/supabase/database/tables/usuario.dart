import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'Usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get codigo => getField<int>('codigo')!;
  set codigo(int value) => setField<int>('codigo', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get senha => getField<String>('senha')!;
  set senha(String value) => setField<String>('senha', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  double? get telefone => getField<double>('telefone');
  set telefone(double? value) => setField<double>('telefone', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);
}
