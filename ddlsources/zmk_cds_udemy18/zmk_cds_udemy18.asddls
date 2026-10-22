@EndUserText.label: 'cds table function with SO'
define table function ZMK_CDS_UDEMY18
with parameters sel_opt_carrid : abap.char( 1000 )
returns {
  mandt : abap.clnt;
  carrid : s_carr_id;
  carrname : s_carrname;
  currcode : s_currcode;
  url : s_carrurl;
  
}
implemented by method zcl_zmk_amdp_ex03=>amdp_function;