import '../database.dart';

class RefeicaoTable extends SupabaseTable<RefeicaoRow> {
  @override
  String get tableName => 'Refeicao';

  @override
  RefeicaoRow createRow(Map<String, dynamic> data) => RefeicaoRow(data);
}

class RefeicaoRow extends SupabaseDataRow {
  RefeicaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RefeicaoTable();

  int get codigoRefeicao => getField<int>('codigo_refeicao')!;
  set codigoRefeicao(int value) => setField<int>('codigo_refeicao', value);

  String get nomeRefeicao => getField<String>('nome_refeicao')!;
  set nomeRefeicao(String value) => setField<String>('nome_refeicao', value);

  int get codigoUsuario => getField<int>('codigo_usuario')!;
  set codigoUsuario(int value) => setField<int>('codigo_usuario', value);

  String? get horarioRefeicao => getField<String>('horario_refeicao');
  set horarioRefeicao(String? value) =>
      setField<String>('horario_refeicao', value);

  int? get codigoDieta => getField<int>('codigo_dieta');
  set codigoDieta(int? value) => setField<int>('codigo_dieta', value);

  String get descricaoRefeicao => getField<String>('descricao_refeicao')!;
  set descricaoRefeicao(String value) =>
      setField<String>('descricao_refeicao', value);

  bool get codigoAtivo => getField<bool>('codigo_ativo')!;
  set codigoAtivo(bool value) => setField<bool>('codigo_ativo', value);
}
