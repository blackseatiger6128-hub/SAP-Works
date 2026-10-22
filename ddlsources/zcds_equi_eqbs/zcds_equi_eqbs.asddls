@AbapCatalog.sqlViewName: 'ZDDL_EQUI_EQBS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Equipment Stock View'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_EQUI_EQBS //as select from I_Equipment as Equi
  -- EQBS Karşılığı (Stok ve Seri Numarası Bağlantısı)
  //association [0..1] to I_SerialNumberStockSegment as Stock 
    //on  Equi.Equipment = Stock.Equipment
    as select from I_SerialNumberStockSegment as Stock
      inner join I_Equipment as Equi
         on Equi.Equipment = Stock.Equipment
{
  key Equi.Equipment,
      Equi.EquipmentCategory,
      Stock._Equipment.Material as Material,
      Stock._Equipment.SerialNumber as SerialNumber,
      Stock.Plant,
      Stock.StorageLocation,
      Stock.InventorySpecialStockType,
      Stock.GoodsMovementStockType,
      Stock.SalesOrder,
      Stock.SalesOrderItem
}
//where Stock.StorageLocation <> '' or Stock.InventorySpecialStockType <> '' 
