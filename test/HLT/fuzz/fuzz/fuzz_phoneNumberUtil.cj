//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
import secodeFuzz.*
from std import unittest.*
from std import unittest.testmacro.*
from std import collection.ArrayList

from http2 import buffer.*

func call_fuzz(string:String){
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
    var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
    phonenumber.formatNationalNumberWithPreferredCarrierCode(phonenumber1, string)
    return
}

func unboundTest():Unit{
    var case_name = CString("Fuzz_phonenumberUtil.formatNationalNumberWithPreferredCarrierCod")
    unsafe{
        // 根据 call_fuzz的入参类型，选择fuzz方法，例如DF_FUZZ_Int64。其他方法见secodeFuzz.cj。其中100000为定义测试次数。其他参数可不变
        DT_FUZZ_String(0,100000,case_name,0,call_fuzz)
        case_name.free()
    }
}

main(){
    unboundTest()
    return
}