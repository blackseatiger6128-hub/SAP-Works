@AbapCatalog.sqlViewAppendName: 'ZMK_SQL_UDEMY14'
@EndUserText.label: 'extend view'
extend view ZMK_CDS_UDEMY13 with ZMK_CDS_UDEMY14
association to scustom as _b
  on a.customid = _b.id
{
  concat(a.carrid,a.connid) as new_id,
  _b.name,
  _b.email
}
