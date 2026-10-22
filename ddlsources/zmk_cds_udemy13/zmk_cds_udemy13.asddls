@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'simple cds view for extend view'
define view ZMK_CDS_UDEMY13 as select from sbook as a
{
    a.carrid,
    a.connid,
    a.customid,
    a.smoker,
    loccuram,
    case a.smoker
     when 'X' then a.loccuram * 2
     else a.loccuram * 1
    end as adjusted_amount
}
