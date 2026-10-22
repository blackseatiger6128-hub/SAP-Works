@AbapCatalog.sqlViewName: 'ZMKV_PERF_MGRMT'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Monthly Employee Count per Manager'
@Metadata.ignorePropagatedAnnotations: true
@Consumption.semanticObject: 'ManagerDashboard'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view ZMKI_PERF_MGR_MONTH as select from ZMKI_PERF_BASE
{
    key PYear,
    key DepartmantId,
    key MonthYear,
    key Manager,
    SortMonth,
    count( distinct Emplid ) as Emp_count
 } 
    where Score > 50 
    group by PYear, DepartmantId, MonthYear, SortMonth, Manager
    
