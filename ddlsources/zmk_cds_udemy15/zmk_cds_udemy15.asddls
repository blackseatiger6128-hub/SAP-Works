@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY15'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'authorization cds view'
define view ZMK_CDS_UDEMY15 
   as select from scarr
{
    carrid,
    carrname,
    currcode,
    url
}
