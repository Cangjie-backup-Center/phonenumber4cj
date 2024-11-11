//3rd_party_lib:phonenumber4cj/build/phonenumber4cj

import std.collection.*
import secodeFuzz.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*


func call_fuzz(int64:Int64){
    let Phonenumber: PhoneNumber = PhoneNumber()
    Phonenumber.setNationalNumbers(int64)
    return
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_Phonenumber.setNationalNumbers")
    unsafe{
        DT_FUZZ_Int64(0,30000000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}
