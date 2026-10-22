@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'filtered associations'
define view ZMK_CDS_UDEMY12 as select from sbook as a
association to scustom as _b
    on a.customid = _b.id
{
    a.carrid,
    a.connid,
    a.fldate,
    a.bookid,
    _b.country,
    _b[country = 'CA' ].name, //filtered association
    _b.email
}
