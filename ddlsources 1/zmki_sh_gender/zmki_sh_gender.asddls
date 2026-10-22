@AbapCatalog.sqlViewName: 'ZMK_SH_GENDER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gender SH view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view ZMKI_SH_GENDER 
as select from dd07t
{
 key domname,
 key valpos,
 key ddlanguage,

@ObjectModel.text.element: [ 'GenderText' ]
 domvalue_l as GenderCode,
 ddtext as GenderText
}
where domname = 'ZMKDO_GENDER'
    and ddlanguage = $session.system_language
