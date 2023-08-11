import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RotinaRecord extends FirestoreRecord {
  RotinaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigo_rotina" field.
  int? _codigoRotina;
  int get codigoRotina => _codigoRotina ?? 0;
  bool hasCodigoRotina() => _codigoRotina != null;

  // "codigo_usuario" field.
  int? _codigoUsuario;
  int get codigoUsuario => _codigoUsuario ?? 0;
  bool hasCodigoUsuario() => _codigoUsuario != null;

  // "codigo_dia" field.
  int? _codigoDia;
  int get codigoDia => _codigoDia ?? 0;
  bool hasCodigoDia() => _codigoDia != null;

  // "nome_rotina" field.
  String? _nomeRotina;
  String get nomeRotina => _nomeRotina ?? '';
  bool hasNomeRotina() => _nomeRotina != null;

  // "descricao_rotina" field.
  String? _descricaoRotina;
  String get descricaoRotina => _descricaoRotina ?? '';
  bool hasDescricaoRotina() => _descricaoRotina != null;

  void _initializeFields() {
    _codigoRotina = castToType<int>(snapshotData['codigo_rotina']);
    _codigoUsuario = castToType<int>(snapshotData['codigo_usuario']);
    _codigoDia = castToType<int>(snapshotData['codigo_dia']);
    _nomeRotina = snapshotData['nome_rotina'] as String?;
    _descricaoRotina = snapshotData['descricao_rotina'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rotina');

  static Stream<RotinaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RotinaRecord.fromSnapshot(s));

  static Future<RotinaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RotinaRecord.fromSnapshot(s));

  static RotinaRecord fromSnapshot(DocumentSnapshot snapshot) => RotinaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RotinaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RotinaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RotinaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RotinaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRotinaRecordData({
  int? codigoRotina,
  int? codigoUsuario,
  int? codigoDia,
  String? nomeRotina,
  String? descricaoRotina,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo_rotina': codigoRotina,
      'codigo_usuario': codigoUsuario,
      'codigo_dia': codigoDia,
      'nome_rotina': nomeRotina,
      'descricao_rotina': descricaoRotina,
    }.withoutNulls,
  );

  return firestoreData;
}

class RotinaRecordDocumentEquality implements Equality<RotinaRecord> {
  const RotinaRecordDocumentEquality();

  @override
  bool equals(RotinaRecord? e1, RotinaRecord? e2) {
    return e1?.codigoRotina == e2?.codigoRotina &&
        e1?.codigoUsuario == e2?.codigoUsuario &&
        e1?.codigoDia == e2?.codigoDia &&
        e1?.nomeRotina == e2?.nomeRotina &&
        e1?.descricaoRotina == e2?.descricaoRotina;
  }

  @override
  int hash(RotinaRecord? e) => const ListEquality().hash([
        e?.codigoRotina,
        e?.codigoUsuario,
        e?.codigoDia,
        e?.nomeRotina,
        e?.descricaoRotina
      ]);

  @override
  bool isValidKey(Object? o) => o is RotinaRecord;
}
