@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item'
@VDM: {
  viewType: #BASIC,
  lifecycle.contract.type: #PUBLIC_LOCAL_API
}
@AccessControl: {
  authorizationCheck: #CHECK,
  personalData.blocking: #('TRANSACTIONAL_DATA'),
  privilegedAssociations: [ '_CreatedByUser', '_BusinessAreaText','_MaterialText','_OrigMaterialText','_ShippingPointText' ]
}
@AbapCatalog: {
  sqlViewName:            'ISDSLSORDERITEM',
  preserveKey: true,
  compiler.compareFilter: true
}
@ObjectModel: {
  representativeKey: 'SalesOrderItem',
  usageType: {
    dataClass:      #TRANSACTIONAL,
    serviceQuality: #B,
    sizeCategory:   #XL
  }
}
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #DIMENSION
@Metadata.allowExtensions: true

define view I_SalesOrderItem
  as select from I_SalesDocumentItem as SalesDocumentItem


  //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
  association [0..*] to I_BusinessAreaText             as _BusinessAreaText  on  $projection.BusinessArea = _BusinessAreaText.BusinessArea
  association [0..*] to I_MaterialText                 as _MaterialText      on  $projection.Material = _MaterialText.Material
  association [0..*] to I_MaterialText                 as _OrigMaterialText  on  $projection.OriginallyRequestedMaterial = _OrigMaterialText.Material
  association [0..*] to I_ShippingPointText            as _ShippingPointText on  $projection.ShippingPoint = _ShippingPointText.ShippingPoint
  // ]--GENERATED
  association [1..1] to I_SalesOrder                   as _SalesOrder        on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [0..*] to I_SalesOrderScheduleLine       as _ScheduleLine      on  $projection.SalesOrder     = _ScheduleLine.SalesOrder
                                                                             and $projection.SalesOrderItem = _ScheduleLine.SalesOrderItem
  association [0..*] to I_SalesOrderItemPartner        as _Partner           on  $projection.SalesOrder     = _Partner.SalesOrder
                                                                             and $projection.SalesOrderItem = _Partner.SalesOrderItem
  association [0..*] to I_SalesOrderItemPricingElement as _PricingElement    on  $projection.SalesOrder     = _PricingElement.SalesOrder
                                                                             and $projection.SalesOrderItem = _PricingElement.SalesOrderItem

  //Extensibility
  association [0..1] to E_SalesDocumentItemBasic       as _Extension         on  SalesDocumentItem.SalesDocument     = _Extension.SalesDocument
                                                                             and SalesDocumentItem.SalesDocumentItem = _Extension.SalesDocumentItem

{
      //Key
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key cast(SalesDocument as vdm_sales_order preserving type)      as  SalesOrder,
      @ObjectModel.text.element: 'SalesOrderItemText'
  key cast(SalesDocumentItem as sales_order_item preserving type) as  SalesOrderItem,

      // Category
      @ObjectModel.foreignKey.association: '_ItemCategory'
      SalesDocumentItemCategory                                   as  SalesOrderItemCategory,
      SalesDocumentItemType                                       as  SalesOrderItemType,
      IsReturnsItem,

      //Admin
      CreatedByUser,
      @Semantics.systemDate.createdAt: true
      CreationDate,
      CreationTime,
      @Semantics.systemDate.lastChangedAt: true
      LastChangeDate,

      //Org
      @ObjectModel.foreignKey.association: '_Division'
      Division,

      //Product
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_MaterialStdVH',
                     element: 'Material' }
        }]
      @ObjectModel.text.association: '_MaterialText'
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_Material'
      Material,
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_MaterialStdVH',
                     element: 'Material' }
        }]
      @ObjectModel.text.association: '_OrigMaterialText'
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_OriginallyRequestedMaterial'
      OriginallyRequestedMaterial,
      MaterialByCustomer,
      InternationalArticleNumber,
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_BatchStdVH',
                     element: 'Batch' },
          additionalBinding: [{ localElement: 'Plant',
                                element: 'Plant' },
                              { localElement: 'Material',
                                element: 'Material' }]
        }]
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_Batch'
      Batch,
      @ObjectModel.foreignKey.association: '_ProductHierarchyNode'
      ProductHierarchyNode,
      ProductCatalog,
      @ObjectModel.foreignKey.association: '_MaterialSubstitutionReason'
      MaterialSubstitutionReason,
      @ObjectModel.foreignKey.association: '_MaterialGroup'
      MaterialGroup,
      @ObjectModel.foreignKey.association: '_MaterialPricingGroup'
      MaterialPricingGroup,
      @ObjectModel.foreignKey.association: '_AdditionalMaterialGroup1'
      AdditionalMaterialGroup1,
      @ObjectModel.foreignKey.association: '_AdditionalMaterialGroup2'
      AdditionalMaterialGroup2,
      @ObjectModel.foreignKey.association: '_AdditionalMaterialGroup3'
      AdditionalMaterialGroup3,
      @ObjectModel.foreignKey.association: '_AdditionalMaterialGroup4'
      AdditionalMaterialGroup4,
      @ObjectModel.foreignKey.association: '_AdditionalMaterialGroup5'
      AdditionalMaterialGroup5,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      @ObjectModel.foreignKey.association: '_StorageLocation'
      StorageLocation,
      DeliveryGroup,
      ProductConfiguration,

      //Sales
      @Semantics.text: true
      SalesDocumentItemText                                       as  SalesOrderItemText,
      PurchaseOrderByCustomer,
      UnderlyingPurchaseOrderItem,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_OrderQuantityUnit'
      OrderQuantityUnit,
      OrderToBaseQuantityDnmntr,
      OrderToBaseQuantityNmrtr,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      TargetQuantity,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_TargetQuantityUnit'
      TargetQuantityUnit,
      TargetToBaseQuantityDnmntr,
      TargetToBaseQuantityNmrtr,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ConfdDelivQtyInOrderQtyUnit,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      TargetDelivQtyInOrderQtyUnit,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      ConfdDeliveryQtyInBaseUnit,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_BaseUnit'
      BaseUnit,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      CommittedDelivQtyInOrdQtyUnit,
      CommittedDelivCreationDate,
      CommittedDeliveryDate,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'RequestedQuantityUnit'
      RequestedQuantity,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_RequestedQuantityUnit'
      RequestedQuantityUnit,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequestedQuantityInBaseUnit,

      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
      ItemGrossWeight,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
      ItemNetWeight,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_ItemWeightUnit'
      ItemWeightUnit,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'ItemVolumeUnit'
      ItemVolume,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_ItemVolumeUnit'
      ItemVolumeUnit,

      ServicesRenderedDate,
      @ObjectModel.foreignKey.association: '_SalesDistrict'
      SalesDistrict,
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_SalesDealStdVH',
                     element: 'SalesDeal' }
        }]
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_SalesDeal'
      SalesDeal,
      SalesPromotion,
      RetailPromotion,
      @ObjectModel.foreignKey.association: '_CustomerGroup'
      CustomerGroup,
      @ObjectModel.foreignKey.association: '_SalesDocumentRjcnReason'
      SalesDocumentRjcnReason,
      RequirementSegment,

      // Pricing
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      @Semantics.currencyCode: true
      @ObjectModel.foreignKey.association: '_TransactionCurrency'
      TransactionCurrency,
      PricingDate,
      ExchangeRateDate,
      PriceDetnExchangeRate,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetPriceAmount,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      NetPriceQuantity,
      @Semantics.unitOfMeasure: true
      @ObjectModel.foreignKey.association: '_NetPriceQuantityUnit'
      NetPriceQuantityUnit,

      @ObjectModel.foreignKey.association: '_StatisticalValueControl'
      StatisticalValueControl,

      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TaxAmount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CostAmount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal1Amount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal2Amount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal3Amount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal4Amount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal5Amount,
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Subtotal6Amount,
      SalesDocumentCondition                                      as  SalesOrderCondition,

      //Shipping
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_ShippingPointStdVH',
                     element: 'ShippingPoint' }
        }]
      @ObjectModel.text.association: '_ShippingPointText'
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_ShippingPoint'
      ShippingPoint,
      @ObjectModel.foreignKey.association: '_ShippingType'
      ShippingType,
      InventorySpecialStockType,
      @ObjectModel.foreignKey.association: '_DeliveryPriority'
      DeliveryPriority,
      @ObjectModel.foreignKey.association: '_Route'
      Route,
      DeliveryDateQuantityIsFixed,
      @Analytics.internalName: #LOCAL
      @ObjectModel.foreignKey.association: '_PartialDeliveryItem'
      PartialDeliveryIsAllowed,
      MaxNmbrOfPartialDelivery,
      UnlimitedOverdeliveryIsAllowed,
      OverdelivTolrtdLmtRatioInPct,
      UnderdelivTolrtdLmtRatioInPct,
      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      MinDeliveryQtyInBaseUnit,
      OpenDeliveryLeadingUnitCode,
      ItemIsDeliveryRelevant,

      //Incoterms
      @ObjectModel.foreignKey.association: '_IncotermsVersion'
      IncotermsVersion,
      @ObjectModel.foreignKey.association: '_IncotermsClassification'
      IncotermsClassification,
      IncotermsTransferLocation,
      IncotermsLocation1,
      IncotermsLocation2,

      //Payment
      @ObjectModel.foreignKey.association: '_CustomerPaymentTerms'
      CustomerPaymentTerms,
      PaymentMethod,
      FixedValueDate,
      AdditionalValueDays,

      //Fashion
      ProductSeasonYear,
      ProductSeason,
      ProductCollection,
      ProductTheme,
      FashionCancelDate,
      ProductCharacteristic1,
      ProductCharacteristic2,
      ProductCharacteristic3,
      ShippingGroupNumber,
      ShippingGroupRule,

      //Billing
      BillingDocumentDate,
      @ObjectModel.foreignKey.association: '_ItemIsBillingRelevant'
      ItemIsBillingRelevant,
      @ObjectModel.foreignKey.association: '_ItemBillingBlockReason'
      ItemBillingBlockReason,
      BillingPlan,

      //Accounting
      FiscalYear,
      FiscalPeriod,
      @ObjectModel.foreignKey.association: '_CustomerAccountAssgmtGroup'
      CustomerAccountAssignmentGroup,
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.valueHelpDefinition: [
        { entity:  { name:    'I_BusinessAreaStdVH',
                     element: 'BusinessArea' }
        }]
      @ObjectModel.text.association: '_BusinessAreaText'
      // ]--GENERATED
      @ObjectModel.foreignKey.association: '_BusinessArea'
      BusinessArea,
      ProfitCenter,
      WBSElement,
      OrderID,
      ControllingObject,
      ProfitabilitySegment,
      OriginSDDocument,
      OriginSDDocumentItem,

      //Reference
      @ObjectModel.foreignKey.association: '_ReferenceSDDocument'
      ReferenceSDDocument,
      @ObjectModel.foreignKey.association: '_ReferenceSDDocumentItem'
      ReferenceSDDocumentItem,
      @ObjectModel.foreignKey.association: '_ReferenceSDDocumentCategory'
      ReferenceSDDocumentCategory,
      HigherLevelItem,

      //Status
      @ObjectModel.foreignKey.association: '_SDProcessStatus'
      SDProcessStatus,
      @ObjectModel.foreignKey.association: '_DeliveryConfirmationStatus'
      DeliveryConfirmationStatus,
      @ObjectModel.foreignKey.association: '_PurchaseConfirmationStatus'
      PurchaseConfirmationStatus,
      @ObjectModel.foreignKey.association: '_TotalDeliveryStatus'
      TotalDeliveryStatus,
      @ObjectModel.foreignKey.association: '_DeliveryStatus'
      DeliveryStatus,
      @ObjectModel.foreignKey.association: '_DeliveryBlockStatus'
      DeliveryBlockStatus,
      @ObjectModel.foreignKey.association: '_OrderRelatedBillingStatus'
      OrderRelatedBillingStatus,
      @ObjectModel.foreignKey.association: '_BillingBlockStatus'
      BillingBlockStatus,
      @ObjectModel.foreignKey.association: '_ItemGeneralIncompletionStatus'
      ItemGeneralIncompletionStatus,
      @ObjectModel.foreignKey.association: '_ItemBillingIncompletionStatus'
      ItemBillingIncompletionStatus,
      @ObjectModel.foreignKey.association: '_PricingIncompletionStatus'
      PricingIncompletionStatus,
      @ObjectModel.foreignKey.association: '_ItemDelivIncompletionSts'
      ItemDeliveryIncompletionStatus,
      @ObjectModel.foreignKey.association: '_SDDocumentRejectionStatus'
      SDDocumentRejectionStatus,
      @ObjectModel.foreignKey.association: '_TotalSDDocReferenceStatus'
      TotalSDDocReferenceStatus,

      //PBS
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CappedNetAmount,
      CappedNetAmtAlertThldInPct,
      //this field is relevant only for PBS scenario 
      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      SalesDocumentItem.TotalStandAloneSellingPrice,

      //Association
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,
                                      #TO_COMPOSITION_ROOT]
      _SalesOrder,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _ScheduleLine,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Partner,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _PricingElement,
      _ItemCategory,
      _CreatedByUser,
      _Division,
      _Material,
      _OriginallyRequestedMaterial,
      _MaterialPlant,
      _Batch,
      _ProductHierarchyNode,
      _MaterialSubstitutionReason,
      _MaterialGroup,
      _MaterialPricingGroup,
      _AdditionalMaterialGroup1,
      _AdditionalMaterialGroup2,
      _AdditionalMaterialGroup3,
      _AdditionalMaterialGroup4,
      _AdditionalMaterialGroup5,
      _Plant,
      _StorageLocation,
      _OrderQuantityUnit,
      _BaseUnit,
      _TargetQuantityUnit,
      _RequestedQuantityUnit,
      _ItemWeightUnit,
      _ItemVolumeUnit,
      _SalesDistrict,
      _SalesDeal,
      _CustomerGroup,
      _SalesDocumentRjcnReason,
      _TransactionCurrency,
      _NetPriceQuantityUnit,
      _StatisticalValueControl,
      _ShippingPoint,
      _ShippingType,
      _DeliveryPriority,
      _PartialDeliveryItem,
      _Route,
      _IncotermsClassification,
      _IncotermsVersion,
      _ItemIsBillingRelevant,
      _ItemBillingBlockReason,
      _CustomerPaymentTerms,
      //PaymentMethod,
      _CustomerAccountAssgmtGroup,
      _BusinessArea,
      _ReferenceSDDocument,
      _ReferenceSDDocumentItem,
      _ReferenceSDDocumentCategory,
      _SDProcessStatus,
      _DeliveryConfirmationStatus,
      _PurchaseConfirmationStatus,
      _TotalDeliveryStatus,
      _DeliveryStatus,
      _DeliveryBlockStatus,
      _OrderRelatedBillingStatus,
      _BillingBlockStatus,
      _ItemGeneralIncompletionStatus,
      _ItemBillingIncompletionStatus,
      _PricingIncompletionStatus,
      _ItemDelivIncompletionSts,
      _SDDocumentRejectionStatus,
      _TotalSDDocReferenceStatus,
      _BillingPlan,
      //--[ GENERATED:012:GFBfhxvv7jY4otz}RhcFP0
      @Consumption.hidden: true
      _BusinessAreaText,
      @Consumption.hidden: true
      _MaterialText,
      @Consumption.hidden: true
      _OrigMaterialText,
      @Consumption.hidden: true
      _ShippingPointText
      // ]--GENERATED

}
where
  SalesDocumentItem.SDDocumentCategory = 'C';
