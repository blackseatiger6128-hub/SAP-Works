@AbapCatalog.sqlViewName: 'ZMKVH_MAT_ROOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Root View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view ZMKI_MATERIAL_ROOT as select from mara 
     left outer join makt on makt.matnr = mara.matnr 
                         and makt.spras = $session.system_language   
   association [0..*] to ZMKI_MAT_PLANT_STOCK as _PlantStock on _PlantStock.Material = mara.matnr
   association [0..*] to ZMKI_MAT_SALES_ORG as _Sales on _Sales.Material = mara.matnr 
   association [0..*] to ZMKI_MAT_PURCH as _Purch on _Purch.Material = mara.matnr
{
    key mara.matnr as Material, 
    makt.maktx as Description, 
    mara.mtart as MaterialType,
    mara.meins as BaseUoM, 
    mara.matkl as MaterialGroup, 
    mara.mstae as MaterialStatus, 
    mara.ersda as CreatedOn, 
    _PlantStock, 
    _Sales,
    _Purch
}     
