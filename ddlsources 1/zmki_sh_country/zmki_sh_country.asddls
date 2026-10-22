@AbapCatalog.sqlViewName: 'ZMK_SH_COUNTRY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Country SH View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view ZMKI_SH_COUNTRY
  as select from I_Country
{
@ObjectModel.text.element: [ 'CountryName' ]
@UI.textArrangement: #TEXT_SEPARATE
    key Country,
    _Text[1: Language = 'T' ].CountryName as CountryName
}
where Country = 'US' or Country = 'IN' or Country = 'AU' or Country = 'DE'
