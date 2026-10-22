@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY20'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds cds view with input parameter'
define view ZMK_CDS_UDEMY20 
   with parameters p_carrid: s_carr_id
   as select from scarr
{
    carrid as airline_code,
    carrname as airline_name,
    currcode as currency,
    url as website
}
where carrid = :p_carrid
