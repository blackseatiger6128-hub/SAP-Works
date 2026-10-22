@AbapCatalog.sqlViewName: 'ZMK_SALESITM4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Assoc'
define view ZMK_CDS_SALESORDITEM4 
   as select from vbap as _SalesOrderItem
{
    vbeln as SalesOrder,
    posnr as SalesItem,
    matnr as Material,
    netwr as ItemNetValue,
    waerk as ItemCurrency
}
