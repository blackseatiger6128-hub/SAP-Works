@AbapCatalog.sqlViewName: 'ZMKV_MAT_SLSORG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Org. material view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_MAT_SALES_ORG as select from mvke 
  association [1..1] to mara as _Mat on _Mat.matnr = mvke.matnr 
  { 
   key mvke.matnr as Material, 
   key mvke.vkorg as SalesOrg,
   key mvke.vtweg as DistChannel,
   @EndUserText.label: 'Sales Unit' 
   mvke.vrkme as SalesUnit,
   @EndUserText.label: 'Minimum Order Quantity' 
   @Semantics.quantity.unitOfMeasure: 'SalesUnit' 
   mvke.lfmng as MinOrderQty,
   @EndUserText.label: 'Item Category Group' 
   _Mat.mtpos_mara as ItemCatGroup, 
   mvke.dwerk as DeliveringPlant, 
   mvke.prodh as ProductHierarchySD 
}
