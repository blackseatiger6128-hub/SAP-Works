@AbapCatalog.sqlViewName: 'ZMKV_PERF_BASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Performance Base View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_PERF_BASE as select from zmkdb_empl_perf
{
  key emplid as Emplid,
  key perfmonth as PerfMonth,
  @UI.selectionField: [{ position: 10 }] 
  @EndUserText.label: 'Department'
  key depid as DepartmantId,
  manager as Manager, 
  score as Score,
  substring(perfmonth, 1, 4) as PYear, 
  substring(perfmonth, 5, 2) as PMonth,
  concat( 
      concat(substring(perfmonth, 5, 2), '.'), substring(perfmonth, 1, 4) 
  ) as MonthYear, 
  cast(substring(perfmonth, 1, 6) as abap.numc(6)) as SortMonth
}
