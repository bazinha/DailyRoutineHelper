import '../database.dart';

class TreinoTable extends SupabaseTable<TreinoRow> {
  @override
  String get tableName => 'Treino';

  @override
  TreinoRow createRow(Map<String, dynamic> data) => TreinoRow(data);
}

class TreinoRow extends SupabaseDataRow {
  TreinoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TreinoTable();

  int get codigoTreino => getField<int>('codigo_treino')!;
  set codigoTreino(int value) => setField<int>('codigo_treino', value);

  String get nomeTreino => getField<String>('nome_treino')!;
  set nomeTreino(String value) => setField<String>('nome_treino', value);

  String get descricaoTreino => getField<String>('descricao_treino')!;
  set descricaoTreino(String value) =>
      setField<String>('descricao_treino', value);

  bool get codigoAtivo => getField<bool>('codigo_ativo')!;
  set codigoAtivo(bool value) => setField<bool>('codigo_ativo', value);

  int? get codigoUsuario => getField<int>('codigo_usuario');
  set codigoUsuario(int? value) => setField<int>('codigo_usuario', value);
}
