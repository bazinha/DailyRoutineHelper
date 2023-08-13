import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_inicial_model.dart';
export 'pagina_inicial_model.dart';

class PaginaInicialWidget extends StatefulWidget {
  const PaginaInicialWidget({Key? key}) : super(key: key);

  @override
  _PaginaInicialWidgetState createState() => _PaginaInicialWidgetState();
}

class _PaginaInicialWidgetState extends State<PaginaInicialWidget> {
  late PaginaInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaInicialModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsuarioRow>>(
      future: UsuarioTable().querySingleRow(
        queryFn: (q) => q.eq(
          'email',
          currentUserEmail,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsuarioRow> paginaInicialUsuarioRowList = snapshot.data!;
        final paginaInicialUsuarioRow = paginaInicialUsuarioRowList.isNotEmpty
            ? paginaInicialUsuarioRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Design_sem_nome.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.12, -1.01),
                    child: Container(
                      width: 1332.0,
                      height: 82.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C4494),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 31.95),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Ola,',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ].addToStart(SizedBox(width: 100.0)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FutureBuilder<List<UsuarioRow>>(
                                    future: UsuarioTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'codigo',
                                        paginaInicialUsuarioRow?.codigo,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsuarioRow> rowUsuarioRowList =
                                          snapshot.data!;
                                      final rowUsuarioRow =
                                          rowUsuarioRowList.isNotEmpty
                                              ? rowUsuarioRowList.first
                                              : null;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              rowUsuarioRow?.nome,
                                              '.',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                          ),
                                        ].addToStart(SizedBox(width: 140.0)),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.85, 0.3),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Edit');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.97, -0.99),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(250.0),
                              child: Image.asset(
                                'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                height: 68.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.76),
                    child: Container(
                      width: 436.0,
                      height: 109.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.6),
                                child: Text(
                                  'Hoje e:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.08, 0.11),
                                child: Text(
                                  dateTimeFormat(
                                      'MMMMEEEEd', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.3),
                    child: Container(
                      width: 435.0,
                      height: 222.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 6.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.1),
                                    child: FutureBuilder<List<MetaRow>>(
                                      future: MetaTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'codigo_usuario',
                                              paginaInicialUsuarioRow?.codigo,
                                            )
                                            .eq(
                                              'codigo_inicio',
                                              true,
                                            )
                                            .eq(
                                              'codigo_ativa',
                                              true,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<MetaRow> columnMetaRowList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                columnMetaRowList.length,
                                                (columnIndex) {
                                              final columnMetaRow =
                                                  columnMetaRowList[
                                                      columnIndex];
                                              return Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  Colors.black,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxValueMap[
                                                                  columnMetaRow] ??= !true,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxValueMap[
                                                                            columnMetaRow] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  await MetaTable()
                                                                      .update(
                                                                    data: {
                                                                      'codigo_ativa':
                                                                          false,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'codigo_meta',
                                                                      columnMetaRow
                                                                          .codigoMeta,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await MetaTable()
                                                                      .update(
                                                                    data: {
                                                                      'codigo_ativa':
                                                                          true,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'codigo_meta',
                                                                      columnMetaRow
                                                                          .codigoMeta,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              checkColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Text(
                                                              columnMetaRow
                                                                  .nomeMeta,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.1, -0.95),
                            child: Container(
                              width: 111.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF1C4494),
                                borderRadius: BorderRadius.circular(15.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Metas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, 0.75),
                    child: Container(
                      width: 435.0,
                      height: 136.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.11, 0.36),
                            child: FutureBuilder<List<TreinoRow>>(
                              future: TreinoTable().querySingleRow(
                                queryFn: (q) => q
                                    .eq(
                                      'codigo_ativo',
                                      true,
                                    )
                                    .eq(
                                      'codigo_usuario',
                                      paginaInicialUsuarioRow?.codigo,
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TreinoRow> textTreinoRowList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final textTreinoRow =
                                    textTreinoRowList.isNotEmpty
                                        ? textTreinoRowList.first
                                        : null;
                                return Text(
                                  textTreinoRow!.nomeTreino,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.1, -0.95),
                            child: Container(
                              width: 111.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF1C4494),
                                borderRadius: BorderRadius.circular(15.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Treino',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.02, -0.07),
                            child: Text(
                              'Seu treino é:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, 0.31),
                    child: Container(
                      width: 435.0,
                      height: 137.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: FutureBuilder<List<DietaRow>>(
                        future: DietaTable().querySingleRow(
                          queryFn: (q) => q
                              .eq(
                                'codigo_inicio',
                                true,
                              )
                              .eq(
                                'codigo_ativo',
                                true,
                              )
                              .eq(
                                'codigo_usuario',
                                paginaInicialUsuarioRow?.codigo,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<DietaRow> stackDietaRowList = snapshot.data!;
                          final stackDietaRow = stackDietaRowList.isNotEmpty
                              ? stackDietaRowList.first
                              : null;
                          return Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.1, -0.95),
                                child: Container(
                                  width: 111.0,
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1C4494),
                                    borderRadius: BorderRadius.circular(15.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Dieta',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.13),
                                child: Text(
                                  'Sua proxima refeicao é:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.07, 0.38),
                                child: FutureBuilder<List<RefeicaoRow>>(
                                  future: RefeicaoTable().querySingleRow(
                                    queryFn: (q) => q.lte(
                                      'horario_refeicao',
                                      dateTimeFormat('Hm', getCurrentTimestamp),
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<RefeicaoRow> textRefeicaoRowList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final textRefeicaoRow =
                                        textRefeicaoRowList.isNotEmpty
                                            ? textRefeicaoRowList.first
                                            : null;
                                    return Text(
                                      textRefeicaoRow!.nomeRefeicao,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.69, 0.0),
                      child: Container(
                        width: 393.0,
                        height: 643.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FutureBuilder<List<RotinaRow>>(
                                    future: RotinaTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'codigo_usario',
                                            paginaInicialUsuarioRow?.codigo,
                                          )
                                          .gte(
                                            'horario_rotina',
                                            dateTimeFormat(
                                                'Hm',
                                                dateTimeFromSecondsSinceEpoch(
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch)),
                                          )
                                          .eq(
                                            'codigo_ativo',
                                            true,
                                          )
                                          .order('codigo_rotina',
                                              ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<RotinaRow> listViewRotinaRowList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewRotinaRowList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 5.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewRotinaRow =
                                              listViewRotinaRowList[
                                                  listViewIndex];
                                          return Container(
                                            width: 0.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.7),
                                                    child: Text(
                                                      listViewRotinaRow
                                                          .horarioRotina,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.2),
                                                    child: Text(
                                                      listViewRotinaRow
                                                          .nomeRotina,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.6),
                                                    child: Text(
                                                      listViewRotinaRow
                                                          .descricaoRotina,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                fontSize: 13.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.03, -0.95),
                                  child: Container(
                                    width: 111.0,
                                    height: 41.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1C4494),
                                      borderRadius: BorderRadius.circular(15.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.01, -0.92),
                              child: Text(
                                'Rotina',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(-0.17, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 75.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C4494),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -0.97),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    FFIcons.kgoalSvgrepoCom,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('Goal');
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.56),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    21.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Metas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.33, -0.88),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  FFIcons.ktimeSvgrepoCom,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 50.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Rotina');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, 0.64),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    21.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Rotina',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.56),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    21.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Metas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.26, -1.23),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  FFIcons.kmealSvgrepoCom,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 60.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Dieta');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.24, 0.56),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    21.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Dieta',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.79, -2.12),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  FFIcons.kdumbbellSvgrepoCom,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 200.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Treino');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.77, 0.52),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    21.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Treino',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
