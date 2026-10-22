@AbapCatalog.sqlViewName: 'ZMK_PRQUANCON2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Quantity Conversions'
define view ZMK_CDS_PR_QUAN_CONV2 
    as select from mara
{
    key matnr as Material,
    
    @Semantics.quantity.unitOfMeasure: 'SourceUnit'
    brgew as MaterialQuan,
    
    @Semantics.unitOfMeasure: true
    meins as SourceUnit,
    
    @Semantics.quantity.unitOfMeasure: 'DispUnit'
    unit_conversion( quantity => brgew,
                     source_unit => meins,
                     target_unit => gewei ) as ConvQuantity,
                     
    @Semantics.unitOfMeasure: true
    gewei as DispUnit
} where matnr = 'G2TAA090L4BB1421C'
