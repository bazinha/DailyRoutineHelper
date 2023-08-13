import '../database.dart';

class MetaTable extends SupabaseTable<MetaRow> {
  @override
  String get tableName => 'Meta';

  @override
  MetaRow createRow(Map<String, dynamic> data) => MetaRow(data);
}

class MetaRow extends SupabaseDataRow {
  MetaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MetaTable();

  int get codigoMeta => getField<int>('codigo_meta')!;
  set codigoMeta(int value) => setField<int>('codigo_meta', value);

  String get nomeMeta => getField<String>('nome_meta')!;
  set nomeMeta(String value) => setField<String>('nome_meta', value);

  int get codigoUsuario => getField<int>('codigo_usuario')!;
  set codigoUsuario(int value) => setField<int>('codigo_usuario', value);

  DateTime? get dataprazoMeta => getField<DateTime>('dataprazo_meta');
  set dataprazoMeta(DateTime? value) =>
      setField<DateTime>('dataprazo_meta', value);

  String? get descricaoMeta => getField<String>('descricao_meta');
  set descricaoMeta(String? value) => setField<String>('descricao_meta', value);

  bool get codigoAtiva => getField<bool>('codigo_ativa')!;
  set codigoAtiva(bool value) => setField<bool>('codigo_ativa', value);

  bool get codigoInicio => getField<bool>('codigo_inicio')!;
  set codigoInicio(bool value) => setField<bool>('codigo_inicio', value);
}
