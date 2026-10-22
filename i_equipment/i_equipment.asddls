@EndUserText.label: 'Equipment'
@Analytics: { dataCategory: #DIMENSION }
@VDM.viewType: #BASIC
@AbapCatalog: { sqlViewName: 'IEQUIPMENT', compiler.compareFilter, preserveKey }

@AccessControl: {
  authorizationCheck:#CHECK,
  privilegedAssociations:['_CreatedByUser','_LastChangedByUser']
}
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.semanticKey:  [ 'Equipment' ]
@AccessControl.personalData.blocking: #REQUIRED
@ClientHandling.algorithm: #SESSION_VARIABLE
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #L

@Metadata: { ignorePropagatedAnnotations, allowExtensions }

define view I_Equipment
  as select from equi
  association [0..1] to I_EquipmentCategory         as _EquipmentCategory         on  _EquipmentCategory.EquipmentCategory = $projection.EquipmentCategory
  association [0..1] to I_TechnicalObjectType       as _TechnicalObjectType       on  _TechnicalObjectType.TechnicalObjectType = $projection.TechnicalObjectType
  association [0..*] to I_EquipmentText             as _EquipmentText             on  _EquipmentText.Equipment = $projection.Equipment
  association [0..*] to I_EquipmentTimeSeg          as _EquipmentTimeSeg          on  _EquipmentTimeSeg.Equipment = $projection.Equipment
  association [0..1] to I_EquipmentTimeSeg          as _CurrentTimeSegment        on  _CurrentTimeSegment.Equipment                      = $projection.Equipment
                                                                                  and _CurrentTimeSegment.EquipUsagePeriodSequenceNumber = '001'
                                                                                  and _CurrentTimeSegment.ValidityEndDate                = '99991231'
  association [0..1] to I_Plant                     as _Plant                     on  $projection.Plant = _Plant.Plant
  association [0..1] to I_User                      as _CreatedByUser             on  $projection.CreatedByUser = _CreatedByUser.UserID
  association [0..1] to I_User                      as _LastChangedByUser         on  $projection.LastChangedByUser = _LastChangedByUser.UserID
  association [0..1] to I_Currency                  as _Currency                  on  $projection.Currency = _Currency.Currency
  association [0..1] to I_Division                  as _Division                  on  $projection.Division = _Division.Division
  association [0..1] to I_StorageLocation           as _StorageLocation           on  $projection.StorageLocation = _StorageLocation.StorageLocation
                                                                                  and $projection.Plant           = _StorageLocation.Plant
  association [0..1] to I_SerialNumberStockSegment  as _SerialNumberStockSegment  on  $projection.Equipment = _SerialNumberStockSegment.Equipment
  association [0..1] to I_Material                  as _Material                  on  $projection.Material = _Material.Material
  association [0..1] to I_Customer                  as _Customer                  on  $projection.Customer = _Customer.Customer
  association [0..1] to I_Country                   as _ManufacturerCountry       on  $projection.ManufacturerCountry = _ManufacturerCountry.Country
  --  association [0..1] to I_BatchCrossPlant          as _BatchCrossPlant          on  $projection.Material = _BatchCrossPlant.Material
  --                                                                                and $projection.Batch    = _BatchCrossPlant.Batch
  association [0..1] to I_Batch                     as _Batch                     on  $projection.Plant    = _Batch.Plant
                                                                                  and $projection.Material = _Batch.Material
                                                                                  and $projection.Batch    = _Batch.Batch
  association [0..1] to I_MasterWarranty            as _MasterWarranty            on  $projection.MasterWarranty = _MasterWarranty.MasterWarranty
  association [0..*] to I_PlantMaintenancePartner   as _PlantMaintenancePartner   on  $projection.MaintObjectInternalID = _PlantMaintenancePartner.MaintObjectInternalID
  association [0..*] to I_MasterWrntyObjectAssgmt   as _MasterWrntyObjectAssgmt   on  $projection.MaintObjectInternalID = _MasterWrntyObjectAssgmt.ObjectInternalID
  association [0..1] to I_Supplier                  as _Supplier                  on  $projection.Supplier = _Supplier.Supplier
  association [0..1] to I_UnitOfMeasure             as _GrossWeightUnit           on  $projection.GrossWeightUnit = _GrossWeightUnit.UnitOfMeasure
  association [0..1] to I_LinearAssetManagementData as _LinearAssetManagementData on  $projection.Equipment                           = _LinearAssetManagementData.LinearDataObjectKey
                                                                                  and _LinearAssetManagementData.LinearDataObjectType = 'IE'
  association [0..*] to I_StatusObjectStatus        as _Status                    on  $projection.MaintObjectInternalID = _Status.StatusObject
{
      @ObjectModel.text.association: '_EquipmentText'
  key equi.equnr           as Equipment,


      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_EquipmentCategoryStdVH',
                     element: 'EquipmentCategory' }
        }]

      @ObjectModel.foreignKey.association: '_EquipmentCategory'
      equi.eqtyp           as EquipmentCategory,

      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_TechnicalObjectTypeStdVH',
                     element: 'TechnicalObjectType' }
        }]

      @ObjectModel.foreignKey.association: '_TechnicalObjectType'
      equi.eqart           as TechnicalObjectType,
      @ObjectModel.foreignKey.association: '_Plant'
      equi.werk            as Plant,
      @ObjectModel.foreignKey.association: '_Division'
      equi.sparte          as Division,
      @ObjectModel.foreignKey.association: '_StorageLocation'
      equi.lager           as StorageLocation,

      // Admin data
      @Semantics.user.createdBy: true
      equi.ernam           as CreatedByUser,
      @Semantics.user.lastChangedBy: true
      equi.aenam           as LastChangedByUser,
      @Semantics.systemDate.createdAt : true
      equi.erdat           as CreationDate,
      @Semantics.systemDate.lastChangedAt: true
      equi.aedat           as LastChangeDate,

      equi.herst           as AssetManufacturerName,
      equi.typbz           as ManufacturerPartTypeName,
      @Semantics.address.country: true
      @ObjectModel.foreignKey.association: '_ManufacturerCountry'
      equi.herld           as ManufacturerCountry,

      equi.baujj           as ConstructionYear,
      equi.baumm           as ConstructionMonth,

      equi.ansdt           as AcquisitionDate,

      @Semantics.currencyCode:true
      equi.waers           as Currency,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      equi.answt           as AcquisitionValue,

      equi.objnr           as MaintObjectInternalID,
      equi.sernr           as SerialNumber,
      equi.eqlfn           as EquipUsagePeriodSequenceNumber,

      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_MaterialStdVH',
                     element: 'Material' }
        }]

      @ObjectModel.foreignKey.association: '_Material'
      equi.matnr           as Material,
      @ObjectModel.foreignKey.association: '_Customer'
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_Customer_VH',
                     element: 'Customer' }
        }]
      equi.kunde           as Customer,
      equi.begru           as AuthorizationGroup,
      equi.serge           as ManufacturerSerialNumber,

      equi.uii             as UniqueItemIdentifier,
      equi.iuid_type       as UniqueItemIdentifierStrucType,
      equi.uii_plant       as UniqueItemIdentifierRespPlant,

      equi.act_change_aa   as AssetSynchronizationRule,

      equi.invnr           as InventoryNumber,
      @Semantics.quantity.unitOfMeasure: 'GrossWeightUnit'
      @DefaultAggregation:#SUM
      equi.brgew           as GrossWeight,
      @ObjectModel.foreignKey.association: '_GrossWeightUnit'
      @Semantics.unitOfMeasure: true
      equi.gewei           as GrossWeightUnit,
      equi.groes           as SizeOrDimensionText,

      equi.charge          as Batch,

      equi.inbdt           as OperationStartDate,

      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_Supplier_VH',
                     element: 'Supplier' }
        }]
      @ObjectModel.foreignKey.association: '_Supplier'
      equi.elief           as Supplier,
      equi.s_equi          as HasEquipmentData,
      @ObjectModel.foreignKey.association: '_MasterWarranty'
      equi.mganr           as MasterWarranty,
      
      equi.changeddatetime as LastChangeDateTime,

      // Propagate associations
      _MasterWarranty,
      _CreatedByUser,
      _LastChangedByUser,
      _EquipmentText,
      _EquipmentCategory,
      _TechnicalObjectType,
      _EquipmentTimeSeg,
      _Currency,
      _Plant,
      _Division,
      _StorageLocation,
      _SerialNumberStockSegment,
      _Material,
      _Customer,
      _ManufacturerCountry,
      --_BatchCrossPlant: see BCP 1880093140
      _Batch,
      _CurrentTimeSegment,
      _PlantMaintenancePartner,
      _MasterWrntyObjectAssgmt,
      _Supplier,
      _LinearAssetManagementData,
      _GrossWeightUnit,
      _Status
}
