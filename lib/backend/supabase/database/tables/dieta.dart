import '../database.dart';

class DietaTable extends SupabaseTable<DietaRow> {
  @override
  String get tableName => 'Dieta';

  @override
  DietaRow createRow(Map<String, dynamic> data) => DietaRow(data);
}

class DietaRow extends SupabaseDataRow {
  DietaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DietaTable();

  int get codigoDieta => getField<int>('codigo_dieta')!;
  set codigoDieta(int value) => setField<int>('codigo_dieta', value);

  int? get codigoUsuario => getField<int>('codigo_usuario');
  set codigoUsuario(int? value) => setField<int>('codigo_usuario', value);

  String get nomeDieta => getField<String>('nome_dieta')!;
  set nomeDieta(String value) => setField<String>('nome_dieta', value);

  String? get descricaoDieta => getField<String>('descricao_dieta');
  set descricaoDieta(String? value) =>
      setField<String>('descricao_dieta', value);

  bool get codigoAtivo => getField<bool>('codigo_ativo')!;
  set codigoAtivo(bool value) => setField<bool>('codigo_ativo', value);

  bool get codigoInicio => getField<bool>('codigo_inicio')!;
  set codigoInicio(bool value) => setField<bool>('codigo_inicio', value);
}
