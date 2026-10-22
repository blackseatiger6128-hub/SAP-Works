@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'path expression association'
define view ZMK_CDS_UDEMY11 as select from ZMK_CDS_UDEMY10 as c
{
    c.carrid,
    c.connid,
    c.fldate,
    c.bookid,
    c._b.email, //path expression
    c._b.name   //path expression
}
