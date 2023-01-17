//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*


func call_fuzz(string:String){
    let ph: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    println(string)
    ph.setFormat(string)
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_ph.setFormat")
    unsafe{
        DT_FUZZ_String(0,100000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}