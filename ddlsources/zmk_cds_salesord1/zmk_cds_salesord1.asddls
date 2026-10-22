@AbapCatalog.sqlViewName: 'ZMK_SALESORD1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order 1'
define view ZMK_CDS_SALESORD1 as select from vbap
{
    key vbeln        as SalesDoc,
    min(netwr)       as MinAmount,
    max(netwr)       as MaxAmount,
    avg(netwr)       as AvgAmount,
    count(*)         as ItemCount,
    count(distinct matnr) as DistinctMaterial
} group by vbeln, pstyv
  having pstyv = 'TAN'
