@AbapCatalog.sqlViewName: 'ISERNUMSTOCKSEG' 
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Serial Number Stock Segment' 
@VDM.viewType: #BASIC
@AccessControl.authorizationCheck: #CHECK 
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.semanticKey:  [ 'Equipment' ] 

@ClientHandling.algorithm: #SESSION_VARIABLE
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

@Analytics: {dataCategory: #DIMENSION }

@Metadata.allowExtensions: true

define view I_SerialNumberStockSegment 
as select from eqbs
  association[0..1] to I_Equipment                 as _Equipment                   on $projection.Equipment = _Equipment.Equipment
  association[0..1] to I_Plant                     as _Plant                       on $projection.Plant = _Plant.Plant
  association[0..1] to I_StorageLocation           as _StorageLocation             on $projection.Plant = _StorageLocation.Plant and $projection.StorageLocation = _StorageLocation.StorageLocation
  association[0..1] to I_SalesOrder                as _SalesOrder                  on $projection.SalesOrder = _SalesOrder.SalesOrder
  association[0..1] to I_SalesOrderItem            as _SalesOrderItem              on $projection.SalesOrder = _SalesOrderItem.SalesOrder and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem
  association[0..1] to I_Customer                  as _Customer                    on $projection.Customer = _Customer.Customer
  association[0..1] to I_CustomerCompanyByPlant    as _CustomerCompanyByPlant      on  $projection.Customer = _CustomerCompanyByPlant.Customer
                                                                                   and $projection.Plant    = _CustomerCompanyByPlant.Plant
  association[0..1] to I_Supplier                  as _Supplier                    on $projection.Supplier = _Supplier.Supplier
  association[0..1] to I_SupplierCompanyByPlant    as _SupplierCompanyByPlant      on  $projection.Supplier = _SupplierCompanyByPlant.Supplier
                                                                                   and $projection.Plant = _SupplierCompanyByPlant.Plant
  association[0..1] to I_InventorySpecialStockType as _InventorySpecialStockType   on $projection.InventorySpecialStockType = _InventorySpecialStockType.InventorySpecialStockType
  association[0..1] to I_WBSElementByInternalKey   as _WBSElementByInternalKey     on $projection.WBSElementInternalID = _WBSElementByInternalKey.WBSElementInternalID
{

  key equnr as Equipment,
         
  @ObjectModel.foreignKey.association: '_Plant'
  b_werk as Plant,   
  
  @ObjectModel.foreignKey.association: '_StorageLocation'
  b_lager as StorageLocation, 
     
  @ObjectModel.foreignKey.association: '_Customer'
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_Customer_VH',
                 element: 'Customer' }
    }]
  kunnr as Customer, 
  
  @ObjectModel.foreignKey.association: '_Supplier'
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_Supplier_VH',
                 element: 'Supplier' }
    }]
  lifnr as Supplier,  
  
  @ObjectModel.foreignKey.association: '_SalesOrder'
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_SalesOrderStdVH',
                 element: 'SalesOrder' }
    }]
  kdauf as SalesOrder, 
  
  @ObjectModel.foreignKey.association: '_SalesOrderItem'
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_SalesOrderItemStdVH',
                 element: 'SalesOrderItem' },
      additionalBinding: [{ localElement: 'SalesOrder',
                            element: 'SalesOrder' }]
    }]
  kdpos as SalesOrderItem,  
  
  @ObjectModel.foreignKey.association: '_InventorySpecialStockType'
  sobkz as InventorySpecialStockType,
    
  @ObjectModel.foreignKey.association: '_WBSElementByInternalKey'
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_WBSElmntByIntKeyStdVH',
                 element: 'WBSElementInternalID' }
    }]
  ps_psp_pnr as WBSElementInternalID, 
  
  b_charge as Batch,     
  lbbsa as GoodsMovementStockType,    
  disub_owner as StockOwner,
    
  // associations
  _Equipment,
  _Plant,
  _StorageLocation,
  _SalesOrder,
  _SalesOrderItem,
  _Customer,
  _CustomerCompanyByPlant,
  _Supplier,
  _SupplierCompanyByPlant,
  _InventorySpecialStockType,
  _WBSElementByInternalKey
}
                                                                                                                            
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 