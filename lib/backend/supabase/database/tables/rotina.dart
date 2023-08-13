import '../database.dart';

class RotinaTable extends SupabaseTable<RotinaRow> {
  @override
  String get tableName => 'Rotina';

  @override
  RotinaRow createRow(Map<String, dynamic> data) => RotinaRow(data);
}

class RotinaRow extends SupabaseDataRow {
  RotinaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RotinaTable();

  int get codigoRotina => getField<int>('codigo_rotina')!;
  set codigoRotina(int value) => setField<int>('codigo_rotina', value);

  String get nomeRotina => getField<String>('nome_rotina')!;
  set nomeRotina(String value) => setField<String>('nome_rotina', value);

  String get descricaoRotina => getField<String>('descricao_rotina')!;
  set descricaoRotina(String value) =>
      setField<String>('descricao_rotina', value);

  String get horarioRotina => getField<String>('horario_rotina')!;
  set horarioRotina(String value) => setField<String>('horario_rotina', value);

  int? get codigoUsario => getField<int>('codigo_usario');
  set codigoUsario(int? value) => setField<int>('codigo_usario', value);

  bool? get codigoAtivo => getField<bool>('codigo_ativo');
  set codigoAtivo(bool? value) => setField<bool>('codigo_ativo', value);
}
