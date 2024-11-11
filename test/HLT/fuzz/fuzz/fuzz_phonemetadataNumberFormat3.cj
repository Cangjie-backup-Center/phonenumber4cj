//3rd_party_lib:phonenumber4cj/build/phonenumber4cj

import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import secodeFuzz.*


func call_fuzz(int32:Int32){

    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    ph.getLeadingDigitsPattern(int32)
    return
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.getLeadingDigitsPattern")
    unsafe{
        DT_FUZZ_Int32(0,30000000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}
