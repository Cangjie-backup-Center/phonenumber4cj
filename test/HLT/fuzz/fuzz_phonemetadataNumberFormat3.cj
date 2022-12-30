//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*


func call_fuzz(int64:InT64){
    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    println(int64)
    ph.getLeadingDigitsPattern(int64)
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.getLeadingDigitsPattern")
    unsafe{
        DT_FUZZ_Int64(0,100000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}