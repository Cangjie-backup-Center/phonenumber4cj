//3rd_party_lib:phonenumber4cj/build/phonenumber4cj

from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*
import secodeFuzz.*


func call_fuzz(string:String){
    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    ph.setFormat(string)
    return
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.setFormat")
    unsafe{
        DT_FUZZ_String(0,30000000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}
