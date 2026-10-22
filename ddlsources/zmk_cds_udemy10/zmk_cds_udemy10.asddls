@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exposed Association'
define view ZMK_CDS_UDEMY10 as select from sbook as a
association [1] to scustom as _b
    on $projection.customid = _b.id
{
    a.carrid,
    a.connid,
    a.fldate,
    a.bookid,
    a.customid,
    _b  //exposed association
}
