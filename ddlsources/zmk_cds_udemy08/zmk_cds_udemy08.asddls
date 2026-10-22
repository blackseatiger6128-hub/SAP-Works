@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consume CDS view in another CDS view'
define view ZMK_CDS_UDEMY08
    with parameters fldat : abap.dats
as select from ZMK_CDS_UDEMY07( smoker_factor: 3,
                                non_smoker_factor: 2,
                                fldat: $parameters.fldat
                                )           
{
    airline,
    amount,
    adjusted_amount,
    fldate
}
