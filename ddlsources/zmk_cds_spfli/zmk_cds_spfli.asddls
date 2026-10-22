@AbapCatalog.sqlViewName: 'ZMK_SQL_SPFLI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'flight_schedule'
@VDM.viewType: #BASIC
define view ZMK_CDS_SPFLI as select from spfli
{
    key carrid as Airline,
    key connid as FlightNumber,
    cityfrom as Cityfrom,
    cityto as Cityto
}
