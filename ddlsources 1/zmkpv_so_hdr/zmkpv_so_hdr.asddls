@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view of ZMKRV_SO_HDR'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
@UI: {
headerInfo: { typeName: 'Order', typeNamePlural: 'Orders',
              title: { type: #STANDARD, value: 'SOrderNo', label: 'Order:' } } }
define root view entity ZMKPV_SO_HDR 
    as projection on ZMKRV_SO_HDR
{
   @UI.facet: [ { id:          'Order',
               purpose:         #STANDARD,
               type:            #IDENTIFICATION_REFERENCE,
               label:           'Order',
               position:        10 } ]
 
    @UI.hidden: true
    key soid as Guid,
    @UI: {
       lineItem:       [ { position: 10, importance: #HIGH } ],
       identification: [ { position: 10, label: 'Order No.' } ] }
    @Search.defaultSearchElement: true
    sorder as SOrderNo,
    @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Customer' } ],
      selectionField: [ { position: 20 } ] }
     @Consumption.valueHelpDefinition: [{ entity : {name: 'ZMKDD_PARTNER', element: 'Partner'  } }] 
    @ObjectModel.text.element: ['Name']
    @Search.defaultSearchElement: true
    partner as Customer,
    _Partner.Name as Name,
    @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30, label: 'Status' } ] }
    @Consumption.valueHelpDefinition: [{ entity : {name: 'ZMKDD_STATUS', element: 'Status'  } }]
    @ObjectModel.text.element: ['Text']
    status as Status,
    _Status.Text as Text,
    @UI: {
       lineItem:       [ { position: 40, importance: #HIGH } ],
       identification: [ { position: 40, label: 'Total Price' } ] }
    @Semantics.amount.currencyCode: 'Currency'
    price,
    @Consumption.valueHelpDefinition: [{entity: {name: 'ZMKDD_CURRENCY', element: 'PriceUnit' }}]
    cuky as Currency,
    @UI: {
       lineItem:       [ { position: 50, importance: #MEDIUM } ],
       identification: [ { position: 50, label: 'Created By' } ] }
    created_by,
    @UI.hidden: true
    created_at,
    @UI.hidden: true
    last_changed_by,
    @UI.hidden: true
    last_changed_at
}
