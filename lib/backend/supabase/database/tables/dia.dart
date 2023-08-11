import '../database.dart';

class DiaTable extends SupabaseTable<DiaRow> {
  @override
  String get tableName => 'Dia';

  @override
  DiaRow createRow(Map<String, dynamic> data) => DiaRow(data);
}

class DiaRow extends SupabaseDataRow {
  DiaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiaTable();

  int get codigoDia => getField<int>('codigo_dia')!;
  set codigoDia(int value) => setField<int>('codigo_dia', value);

  String get nomeDia => getField<String>('nome_dia')!;
  set nomeDia(String value) => setField<String>('nome_dia', value);
}
