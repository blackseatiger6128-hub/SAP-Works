@AbapCatalog.sqlViewName: 'ZMK_SALESHDR4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header'
@ClientHandling.type: #INHERITED
@ClientHandling.algorithm: #AUTOMATED
@VDM.viewType: #BASIC
define view ZMK_CDS_SALESORDHEAD4 as select from vbak as _SalesOrderHeader
association [0..*] to ZMK_CDS_SALESORDITEM4 as _SalesOrderItem
    on $projection.SalesOrder = _SalesOrderItem.SalesOrder
{
  key vbeln as SalesOrder,
  key _SalesOrderItem.SalesItem,
  cast(erdat as abap.char(8)) as CreatedOn,
  case vbtyp
    when 'C' then 'Order'
    when 'A' then 'Inquiry'
    else 'Other doc types'
  end as DocCategory,  
  //vbtyp as DocCategory,
  auart as OrderType,
  augru as OrderReason,
  @Semantics.amount.currencyCode: 'DocCurrency'
  netwr as NetValue,
  currency_conversion( amount => netwr, 
                       source_currency => waerk, 
                       target_currency => cast( 'USD' as waerk ), 
                       exchange_rate_date => erdat ) 
                       as USDAmount,
  cast( netwr as abap.fltp(16) ) * 0.35 as Tax,
  @Semantics.currencyCode: true
  waerk as DocCurrency,
  _SalesOrderItem.Material,
  _SalesOrderItem.ItemNetValue,
  _SalesOrderItem.ItemCurrency
} //where ernam = $session.user
