import '../database.dart';

class ExercicioTable extends SupabaseTable<ExercicioRow> {
  @override
  String get tableName => 'Exercicio';

  @override
  ExercicioRow createRow(Map<String, dynamic> data) => ExercicioRow(data);
}

class ExercicioRow extends SupabaseDataRow {
  ExercicioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExercicioTable();

  int get codigoExercicio => getField<int>('codigo_exercicio')!;
  set codigoExercicio(int value) => setField<int>('codigo_exercicio', value);

  int get codigoUsuario => getField<int>('codigo_usuario')!;
  set codigoUsuario(int value) => setField<int>('codigo_usuario', value);

  int get codigoTreino => getField<int>('codigo_treino')!;
  set codigoTreino(int value) => setField<int>('codigo_treino', value);

  bool get codigoAtivo => getField<bool>('codigo_ativo')!;
  set codigoAtivo(bool value) => setField<bool>('codigo_ativo', value);

  String get nomeExercicio => getField<String>('nome_exercicio')!;
  set nomeExercicio(String value) => setField<String>('nome_exercicio', value);

  String get descricaoExercicio => getField<String>('descricao_exercicio')!;
  set descricaoExercicio(String value) =>
      setField<String>('descricao_exercicio', value);

  int? get numeroSerie => getField<int>('numero_serie');
  set numeroSerie(int? value) => setField<int>('numero_serie', value);

  int? get numeroRepeticao => getField<int>('numero_repeticao');
  set numeroRepeticao(int? value) => setField<int>('numero_repeticao', value);
}
