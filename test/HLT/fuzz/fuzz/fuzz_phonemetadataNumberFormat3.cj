//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
import secodeFuzz.*


func call_fuzz(int64:Int32){

    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    ph.getLeadingDigitsPattern(int32)
    return
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.getLeadingDigitsPattern")
    unsafe{
        DT_FUZZ_Int32(0,100000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}