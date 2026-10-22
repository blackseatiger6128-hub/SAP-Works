@AbapCatalog.sqlViewName: 'ZMKDDL_CNTRY_LOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Logo DD'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_COUNTRY_LOGO
  as select from zmkdb_country
{
  key country  as Country,
     @Semantics.imageUrl: true
      logo_url as CountryLogoUrl,
      case country
         when 'AU' then 'https://www.sap.com/australia/index.html'
         when 'DE' then 'https://www.sap.com/germany/index.html'
         when 'IN' then 'https://www.sap.com/india/index.html'
         when 'US' then 'https://www.sap.com/index.html'
      else ''
      end      as CountryWebLink

}
