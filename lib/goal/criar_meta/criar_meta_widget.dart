import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'criar_meta_model.dart';
export 'criar_meta_model.dart';

class CriarMetaWidget extends StatefulWidget {
  const CriarMetaWidget({Key? key}) : super(key: key);

  @override
  _CriarMetaWidgetState createState() => _CriarMetaWidgetState();
}

class _CriarMetaWidgetState extends State<CriarMetaWidget> {
  late CriarMetaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarMetaModel());

    _model.nameController1 ??= TextEditingController();
    _model.dataController ??= TextEditingController();
    _model.nameController2 ??= TextEditingController();
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
        List<UsuarioRow> criarMetaUsuarioRowList = snapshot.data!;
        final criarMetaUsuarioRow = criarMetaUsuarioRowList.isNotEmpty
            ? criarMetaUsuarioRowList.first
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
                                'Criar Meta',
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
                              controller: _model.nameController1,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          controller: _model.dataController,
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
                            hintText: 'dd/mm/aaaa',
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Container(
                        width: 350.0,
                        child: TextFormField(
                          controller: _model.nameController2,
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
                      'Conte mais sobre a sua meta',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.09, 0.6),
                    child: Container(
                      width: 204.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue = newValue!);
                                  if (newValue!) {
                                    setState(() {
                                      _model.checkboxValue = true;
                                    });
                                  } else {
                                    setState(() {
                                      _model.checkboxValue = false;
                                    });
                                  }
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).success,
                                checkColor: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.9, 0.0),
                            child: Text(
                              'Mostrar na pagina inicial?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.59, 0.88),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await MetaTable().insert({
                          'nome_meta': _model.nameController1.text,
                          'dataprazo_meta':
                              supaSerialize<DateTime>(_model.datePicked),
                          'descricao_meta': _model.nameController2.text,
                          'codigo_usuario': criarMetaUsuarioRow?.codigo,
                          'codigo_inicio': _model.checkboxValue,
                          'codigo_ativa': true,
                        });

                        context.goNamed('Goal');
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: 122.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF1C4494),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                        context.pushNamed('Goal');
                      },
                      text: 'Cancelar',
                      options: FFButtonOptions(
                        width: 122.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFDA0000),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                      'Qual sua meta?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.15, -0.41),
                    child: Text(
                      'Qual o prazo final?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.18, -0.31),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.calendar_month,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        final _datePickedDate = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: getCurrentTimestamp,
                          lastDate: DateTime(2050),
                        );

                        if (_datePickedDate != null) {
                          setState(() {
                            _model.datePicked = DateTime(
                              _datePickedDate.year,
                              _datePickedDate.month,
                              _datePickedDate.day,
                            );
                          });
                        }
                      },
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
