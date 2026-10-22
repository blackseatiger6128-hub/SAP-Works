@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
define view ZMK_CDS_UDEMY05 as select from scarr as c
 inner join (
    sbook as b
      left outer join scustom as s
      on b.customid = s.id
    )
    on c.carrid = b.carrid
{
  b.carrid,
  b.connid,
  b.fldate,
  b.bookid,
  b.customid,
  s.name,
  s.email,
  c.carrname    
}
where b.customid = '00000044'
