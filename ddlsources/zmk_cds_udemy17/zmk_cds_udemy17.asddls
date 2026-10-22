@EndUserText.label: 'CDS table function'
define table function ZMK_CDS_UDEMY17
with parameters @Environment.systemField: #CLIENT 
                i_mandt: s_mandt,
                i_name: s_carrname
returns {
  mandt : abap.clnt;
  carrid : s_carr_id;
  carrname : s_carrname;
  currcode : s_currcode;
  url : s_carrurl;
  
}
implemented by method zcl_zmk_amdp_ex01=>amdp_function;