@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Adhoc association'
define view ZMK_CDS_UDEMY09 as select from sbook as a
association to scustom as _b
    on $projection.customid = _b.id
{
    a.carrid,
    a.connid,
    a.fldate,
    a.bookid,
    a.customid,
    _b.name,  //ad-hoc association
    _b.email  //ad-hoc association
}
