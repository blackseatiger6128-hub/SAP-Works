@AbapCatalog.sqlViewName: 'ZMK_SALORDIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'String Func,Arithmetic Exp,Session Variables'
@VDM.viewType: #BASIC
define view ZMK_CDS_SALESORDITEM2 as select from vbap
{
    key vbeln as SalesOrder,
    key posnr as SalesItem,
        matnr as Material,
        netwr as ItemNetValue,
        waerk as ItemCurrency,
        concat_with_space('Plant', werks, 1) as StorageDetails
}
