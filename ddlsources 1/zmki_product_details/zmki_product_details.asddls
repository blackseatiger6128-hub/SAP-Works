@AbapCatalog.sqlViewName: 'ZMKV_PROD_DTLS'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Details Interface View'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.preserveKey: true
define root view ZMKI_PRODUCT_DETAILS as select from zmkdb_prod_dtls
   //composition of target_data_source_name as _association_name
{
    key p_id                                                                      as PId,
      p_name                                                                    as PName,
      p_cat                                                                     as PCat,
      supplier                                                                  as Supplier,
      rating                                                                    as Rating,
      cuky_field                                                                as CukyField,
      @Semantics.amount.currencyCode: 'CukyField'
      price                                                                     as Price,
      available_p                                                               as Available,
      @Semantics.imageUrl: true
      cast(concat( concat('https://fioridev.gamak.com/sap/opu/odata/SAP/ZSTREAM_OPERATION_SRV/zfileSet
(Mandt=''300'',Filename=',''),concat('''',concat(p_name,''')/$value') ) ) 
as abap.char( 256 ) ) as P_Image_URL
}
