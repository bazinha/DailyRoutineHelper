import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            backgroundColor: Colors.white,
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
        List<UsuarioRow> homePageUsuarioRowList = snapshot.data!;
        final homePageUsuarioRow = homePageUsuarioRowList.isNotEmpty
            ? homePageUsuarioRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Background.png',
                      width: 406.0,
                      height: 866.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.73),
                    child: Container(
                      width: 182.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
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
                              dateTimeFormat('MMMMEEEEd', getCurrentTimestamp),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.01),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://picsum.photos/seed/469/600',
                        width: 0.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.03),
                    child: Container(
                      width: 0.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.93, 0.07),
                    child: Container(
                      width: 175.0,
                      height: 622.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                          homePageUsuarioRow?.codigo,
                                        )
                                        .gte(
                                          'horario_rotina',
                                          dateTimeFormat(
                                              'Hm',
                                              dateTimeFromSecondsSinceEpoch(
                                                  getCurrentTimestamp
                                                      .secondsSinceEpoch)),
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
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.7),
                                                  child: Text(
                                                    listViewRotinaRow
                                                        .horarioRotina,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    style: FlutterFlowTheme.of(
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
                                    color: Color(0xFA2B91CB),
                                    borderRadius: BorderRadius.circular(15.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.91),
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
                    alignment: AlignmentDirectional(-0.47, -0.2),
                    child: Text(
                      'Routine',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).info,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.3),
                    child: Container(
                      width: 181.0,
                      height: 222.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                              homePageUsuarioRow?.codigo,
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
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
                                                                      .lineColor,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
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
                                color: Color(0xFA2B91CB),
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
                    alignment: AlignmentDirectional(-0.17, 1.0),
                    child: Container(
                      width: 411.0,
                      height: 73.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -0.97),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  FFIcons.kgoalSvgrepoCom1,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 50.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Goal');
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.99, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.78, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.86, -4.11),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                FFIcons.kdumbbellSvgrepoCom,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 250.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Workout');
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.44, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.36, -0.97),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                FFIcons.ktimeSvgrepoCom,
                                color: FlutterFlowTheme.of(context).gray200,
                                size: 50.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Routine');
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.15, 0.65),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.22, -1.89),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                FFIcons.kmealSvgrepoCom,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 70.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Dieta');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.12, -1.01),
                    child: Container(
                      width: 455.0,
                      height: 82.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 31.95),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          14.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Ola,',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
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
                                queryFn: (q) => q,
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
                                List<UsuarioRow> rowUsuarioRowList =
                                    snapshot.data!;
                                final rowUsuarioRow =
                                    rowUsuarioRowList.isNotEmpty
                                        ? rowUsuarioRowList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      rowUsuarioRow!.nome,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ].addToStart(SizedBox(width: 140.0)),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.85, 0.3),
                            child: FlutterFlowIconButton(
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.settings,
                                color: Colors.black,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Config');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.87, -0.99),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(250.0),
                      child: Image.asset(
                        'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                        height: 68.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.73, 0.75),
                    child: Container(
                      width: 178.0,
                      height: 136.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                      homePageUsuarioRow?.codigo,
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
                                color: Color(0xFA2B91CB),
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
                    alignment: AlignmentDirectional(-0.73, 0.31),
                    child: Container(
                      width: 178.0,
                      height: 137.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                homePageUsuarioRow?.codigo,
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
                                    color: Color(0xFA2B91CB),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
