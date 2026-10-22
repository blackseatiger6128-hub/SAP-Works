@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY19'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'simple cds view'
define view ZMK_CDS_UDEMY19 as select from scarr
{
    carrid as airline_code,
    carrname as airline_name,
    currcode as currency,
    url as website
}
