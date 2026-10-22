@AbapCatalog.sqlViewName: 'ZMKV_MAT_STOCK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Plant Stock View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_MAT_PLANT_STOCK as select from mard
  association [1..1] to mara as _Mat on _Mat.matnr = mard.matnr 
  association [0..1] to marc as _Plant on _Plant.matnr = mard.matnr 
                                       and _Plant.werks = mard.werks
{
    /* Keys */
    key mard.matnr as Material,
    key mard.werks as Plant, 
    key mard.lgort as StorageLocation, 
    /* Unit via association (project it into the view!) */
     @EndUserText.label: 'Base UoM' 
     _Mat.meins as BaseUoM,
    /* Quantities with proper unit reference */ 
    @EndUserText.label: 'Unrestricted-use Stock'
    @Semantics.quantity.unitOfMeasure: 'BaseUoM' 
    mard.labst as UnrestrictedUse,
    @EndUserText.label: 'Quality Inspection Stock'
    @Semantics.quantity.unitOfMeasure: 'BaseUoM'
    mard.insme as QualityInspection,
    @EndUserText.label: 'Blocked Stock'
    @Semantics.quantity.unitOfMeasure: 'BaseUoM' 
    mard.speme as Blocked, 
    /* Planning context via association */ 
    _Plant.dismm as MRPType,
    _Plant.beskz as ProcurementType, 
    _Plant.dispo as MRPController, 
    _Plant.lgpro as DefaultSLoc,
    _Plant.plifz as PlannedDeliveryTime
}
