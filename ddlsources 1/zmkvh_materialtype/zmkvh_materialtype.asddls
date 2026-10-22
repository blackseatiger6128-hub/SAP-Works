@AbapCatalog.sqlViewName: 'ZMKVH_MAT_TYPE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Type Value Help'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKVH_MATERIALTYPE as select from t134 
    left outer join t134t on t134t.mtart = t134.mtart 
                         and t134t.spras = $session.system_language 
{ 
   key t134.mtart as MaterialType, 
   t134t.mtbez as MaterialTypeText 
   
}
