import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'editar_rotina_model.dart';
export 'editar_rotina_model.dart';

class EditarRotinaWidget extends StatefulWidget {
  const EditarRotinaWidget({
    Key? key,
    required this.codigoRotina,
  }) : super(key: key);

  final int? codigoRotina;

  @override
  _EditarRotinaWidgetState createState() => _EditarRotinaWidgetState();
}

class _EditarRotinaWidgetState extends State<EditarRotinaWidget> {
  late EditarRotinaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarRotinaModel());

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
        List<UsuarioRow> editarRotinaUsuarioRowList = snapshot.data!;
        final editarRotinaUsuarioRow = editarRotinaUsuarioRowList.isNotEmpty
            ? editarRotinaUsuarioRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<RotinaRow>>(
                future: RotinaTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'codigo_rotina',
                    widget.codigoRotina,
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
                  List<RotinaRow> stackRotinaRowList = snapshot.data!;
                  final stackRotinaRow = stackRotinaRowList.isNotEmpty
                      ? stackRotinaRowList.first
                      : null;
                  return Stack(
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
                        alignment: AlignmentDirectional(-1.01, -1.02),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF1C4494),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.91, -0.07),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.home,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('PaginaInicial');
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Editar Rotina',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.2, 0.0),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -0.56),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.nameController1 ??=
                                      TextEditingController(
                                    text: stackRotinaRow?.nomeRotina,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0x75FFFFFF),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x6595A1AC),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x6595A1AC),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x6595A1AC),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Color(0xFF828282),
                                  validator: _model.nameController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.31),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.dataController ??=
                                  TextEditingController(
                                text: stackRotinaRow?.horarioRotina,
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'HH:mm',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                filled: true,
                                fillColor: Color(0x6595A1AC),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              cursorColor: Color(0xFF828282),
                              validator: _model.dataControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.dataMask],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.02, 0.24),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 350.0,
                            child: TextFormField(
                              controller: _model.nameController2 ??=
                                  TextEditingController(
                                text: stackRotinaRow?.descricaoRotina,
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                filled: true,
                                fillColor: Color(0x6595A1AC),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 10,
                              cursorColor: Color(0xFF828282),
                              validator: _model.nameController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.08, -0.16),
                        child: Text(
                          'Conte mais sobre a sua tarefa',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.59, 0.88),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            await RotinaTable().update(
                              data: {
                                'nome_rotina': _model.nameController1.text,
                                'descricao_rotina': _model.nameController2.text,
                                'horario_rotina': _model.dataController.text,
                                'codigo_usario': editarRotinaUsuarioRow?.codigo,
                                'codigo_ativo': true,
                              },
                              matchingRows: (rows) => rows.eq(
                                'codigo_rotina',
                                widget.codigoRotina,
                              ),
                            );

                            context.goNamed('RotinaTudo');
                          },
                          text: 'Confirmar',
                          options: FFButtonOptions(
                            width: 122.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF1C4494),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.49, 0.88),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('RotinaTudo');
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: 122.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFDA0000),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.15, -0.65),
                        child: Text(
                          'Qual sua tarefa?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.15, -0.41),
                        child: Text(
                          'Qual o horario?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.89, 0.89),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFDA0000),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0xFFDA0000),
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await RotinaTable().update(
                              data: {
                                'codigo_ativo': false,
                              },
                              matchingRows: (rows) => rows.eq(
                                'codigo_rotina',
                                widget.codigoRotina,
                              ),
                            );
                            context.safePop();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
