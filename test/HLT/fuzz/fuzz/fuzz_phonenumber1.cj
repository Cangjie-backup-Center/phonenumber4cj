//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
import secodeFuzz.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*


func call_fuzz(int64:Int64){
    let Phonenumber: PhoneNumber = PhoneNumber()
    Phonenumber.setNationalNumbers(int64)
    return
}

func unboundTest():Unit{
    var case_name=CString("Fuzz_Phonenumber.setNationalNumbers")
    unsafe{
        DT_FUZZ_Int64(0,100000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}