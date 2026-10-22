@AbapCatalog.sqlViewName: 'IFICOUNTRYVH'
@EndUserText.label: 'Country Value Help'
@Analytics.dataCategory: #DIMENSION 
@VDM.viewType: #BASIC 
@AccessControl.authorizationCheck: #NOT_REQUIRED   // #CHECK
@ObjectModel.representativeKey: 'Country'
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.usageType.dataClass:  #MASTER
@ObjectModel.usageType.serviceQuality: #A
@Search.searchable: true
@ClientHandling.algorithm: #SESSION_VARIABLE
define view I_CountryVH as select from I_Country {
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    key Country,
    
    @Semantics.text: true
    @Search.defaultSearchElement: true
    _Text[1: Language = $session.system_language].CountryName as Description,
 
    CountryThreeLetterISOCode,
    CountryThreeDigitISOCode,
    
    _Text
}
