@AbapCatalog.sqlViewName: 'ZMKVH_MAT_HELP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Value Help'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKVH_MATERIALF4 as select from makt 
    inner join mara on mara.matnr = makt.matnr 
{
    key mara.matnr as Material,
    key makt.spras as LanguageKey, // e.g. EN, DE 
    makt.maktx as MaterialDescription, 
    mara.mtart as MaterialType // (optional extra column) 
}
