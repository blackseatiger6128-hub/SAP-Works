@AbapCatalog.sqlViewName: 'ZMK_DDL_ADDRESS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Address Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_ADDRESS as select from zmkdb_address
 association [1..1] to ZMKI_SH_COUNTRY  as _ctry on $projection.Country = _ctry.Country
 association [1..1] to ZMKI_COUNTRY_LOGO as _logo on $projection.Country = _logo.Country
{
    key emplid as Emplid,
    street as Street,
    city as City,
    country as Country,
    _ctry.CountryName as CountryName,
    _logo.CountryLogoUrl as CountryLogoUrl,
    _logo.CountryWebLink as CountryWebLink
  
}
