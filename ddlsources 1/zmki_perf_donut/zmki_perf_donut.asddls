@AbapCatalog.sqlViewName: 'ZMKV_PERF_DONUT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Performance Donut View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view ZMKI_PERF_DONUT as select from ZMKI_PERF_BASE
{
    key DepartmantId, 
    PYear, 
    count(*) as EmployeeCount
      
} group by DepartmantId ,PYear
