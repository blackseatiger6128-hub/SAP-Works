@AbapCatalog.sqlViewName: 'ZMK_DDL_SESSION1'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Session Variables'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMK_CDS_SESSION_VAR
as select from vbak
{
    key vbeln as SaleDocNo,
    vbtyp as DocType,
    vkorg as SalesOrg,
    vtweg as DistChannel,
    spart as Division,
    kunnr as CustomerNo,
    case vbtyp
       when 'A' then 'Inquiry'
       when 'B' then 'Quotation'
       when 'C' then //'Order'
          case netwr 
             when 0 then 'Order-Not Paid' 
             else 'Order Paid' 
          end
       else 'Others'
    end as DocCatText ,
    $session.client as ClientNum,
    $session.system_date as SystemDate,
    $session.system_language as SystemLanguage,
    $session.user as UserName
    //$session.user_date as UserDate,
    //$session.user_timezone as UserTimeZone  
}
where mandt = $session.client
