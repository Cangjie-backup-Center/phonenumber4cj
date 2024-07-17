//3rd_party_lib:phonenumber4cj/build/phonenumber4cj

import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import secodeFuzz.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.ArrayList



func call_fuzz(string:String){

    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    ph.setPattern(string)
    return
}
 
func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.setPattern")
    unsafe{
        DT_FUZZ_String(0,30000000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}
