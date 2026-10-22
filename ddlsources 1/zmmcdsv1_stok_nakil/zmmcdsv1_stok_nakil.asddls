@AbapCatalog.sqlViewName: 'ZMM_DDLSTOK_NKL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Stok Nakil View1'
@Metadata.ignorePropagatedAnnotations: true
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define view ZMMCDSV1_STOK_NAKIL 
with parameters p_kabul: abap.char(1),
                p_iptal: abap.char(1),
                p_red : abap.char( 1 )
as select from ZMMCDS_TABLEFUNC_STOK_NAKIL( p_kabul: $parameters.p_kabul, p_red: $parameters.p_red, p_iptal: $parameters.p_iptal,                                            
                                            p_clnt: $session.client ) 
{
  key mblnr as material_313_doc,
  key mjahr as material_313_year,
  key zeile as material_313_pos,
  matnr as material,
  maktx as material_text,
  werks as plant,
  lgort as warehouse_sender,
  lgobe as warehouse_text,
  umlgo as warehouse_rec,
  umlgot as warehouse_rectext,
  charg as batch,
  bwtar as val_type,
  budat as record_date,
  cpudt as doc_date,
  cputm as doc_time,
  usnam as doc_user,
  @Semantics.quantity.unitOfMeasure: 'stock_unit'
  umlme as current_stock,
  @Semantics.quantity.unitOfMeasure: 'stock_unit'
  menge as moved_stock,
  meins as stock_unit,
  hourc as waiting_hours,
  iptalt as cancel_date,
  iptalc as cancel_time,
  kabul_doc as accept_doc,
  kabul_year as accept_year,
  kabul_pos as accept_pos,
  @Semantics.quantity.unitOfMeasure: 'stock_unit'
  kabul_mik as accept_amount,
  kabult as accept_date,
  kabulc as accept_time,
  red_doc as red_doc,
  red_year as red_year,
  red_pos,
  @Semantics.quantity.unitOfMeasure: 'stock_unit'
  red_mik as red_amount,
  redt as red_date,
  redc as red_time
}
