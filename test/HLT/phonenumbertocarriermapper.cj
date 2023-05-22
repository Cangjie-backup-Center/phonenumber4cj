//3rd_party_lib:phonenumber4cj/build/phonenumber4cj

from std import collection.*
from std import sync.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*
from phonenumber4cj import carrier.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.metadata.*



//提供地理位置、时区、运营商相关信息查询功能  查找指定电话号码中的运营商信息(top1)
//class PhoneNumberToCarrierMapper

@Test
public class PhoneNumberToCarrierMapper_1{



    @TestCase
    func PhoneNumberToCarrierMapper_1(): Unit {    

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"") 
    }


  
    @TestCase
    func PhoneNumberToCarrierMapper_2(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English),"")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English),"")
    }

 
    @TestCase
    func PhoneNumberToCarrierMapper_3(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,Chinese))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese),"")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English),"")
    }


  
    @TestCase
    func PhoneNumberToCarrierMapper_4(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"")
    }




    

    @TestCase
    func PhoneNumberToCarrierMapper_5(): Unit {

        var phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phonenumber,English))
        println(phoneNumbertocarriermapper.getNameForNumber(phonenumber,English))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phonenumber,English))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phonenumber,English),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phonenumber,English),"")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phonenumber,English),"")      
    }



    @TestCase
    func PhoneNumberToCarrierMapper_6(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"中国移动")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_7(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"China Mobile")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_8(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese),"中国移动")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_9(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English ))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English ),"China Mobile")
    }



  
    @TestCase
    func PhoneNumberToCarrierMapper_10(): Unit {           


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "US")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"")
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"")
        
    }

    
    @TestCase
    func PhoneNumberToCarrierMapper_11(): Unit {                 


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "US")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"")  
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"")
    }


   
    @TestCase
    func PhoneNumberToCarrierMapper_12(): Unit {                       


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "US")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,English),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English),"")
    }

   
    @TestCase
    func PhoneNumberToCarrierMapper_13(): Unit {                                     


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "US")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese))
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,Chinese))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,Chinese),"")
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,Chinese),"")
  
    }




   
    @TestCase
    func PhoneNumberToCarrierMapper_14(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("101101111", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"")     
    }



    @TestCase
    func PhoneNumberToCarrierMapper_15(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("12315", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"")     
    }



    @TestCase
    func PhoneNumberToCarrierMapper_16(): Unit {

        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(86).setNationalNumbers(13720546848)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"China Mobile")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_17(): Unit {

        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(86).setNationalNumbers(15929551595)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"China Mobile")
    }




    @TestCase
    func PhoneNumberToCarrierMapper_18(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"中国移动")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"中国移动")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_19(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"China Mobile")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"China Mobile")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_20(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,Chinese))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,Chinese),"中国移动")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,Chinese),"中国移动")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_21(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,English),"China Mobile")
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,English),"China Mobile")
    }





    @TestCase
    func PhoneNumberToCarrierMapper_22(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("101101111", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()  
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"")
    }




    @TestCase
    func PhoneNumberToCarrierMapper_23(): Unit {


        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("12315", "CN")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"")
    }



    @TestCase
    func PhoneNumberToCarrierMapper_24(): Unit {

        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(86).setNationalNumbers(13720546848)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"China Mobile")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"China Mobile")
    }


    @TestCase
    func PhoneNumberToCarrierMapper_25(): Unit {

        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(86).setNationalNumbers(15929551595)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,China),"中国移动")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,China),"中国移动")
    }


   
    @TestCase
    func PhoneNumberToCarrierMapper_26(): Unit {
                                                                                                      
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(1).setNationalNumbers(6502123456)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()  
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"")
    }



  
    @TestCase
    func PhoneNumberToCarrierMapper_27(): Unit {
                                                                                                     
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(1).setNationalNumbers(2062019222)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US))
        println(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForNumber(phoneNumber1,US),"")  
        @Assert(phoneNumbertocarriermapper.getSafeDisplayName(phoneNumber1,US),"")
    }


   
    @TestCase
    func PhoneNumberToCarrierMapper_28(): Unit {

        var Phonenumber: PhoneNumber = PhoneNumber()
        var phoneNumber1=Phonenumber.setCountryCodes(1).setNationalNumbers(9175551234)
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,US),"")                 
    }

}

