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
//class PrefixFileReader

@Test
public class prefixmapperTest{



    @TestCase
    func PrefixFileReader_01(): Unit {    
        
        var Phonenumber: PhoneNumber = PhoneNumber()
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/1/1_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,China,"nihao","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,China,"nihao","CN").toString(),"")
    }


    @TestCase
    func PrefixFileReader_02(): Unit {    
        
        var Phonenumber: PhoneNumber = PhoneNumber()
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/1/1_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,China,"nihao","CN").toString(),"")
    }



    @TestCase
    func PrefixFileReader_03(): Unit {    
        
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber=phonenumberUtil.parse("18717619089", "CN")
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/86/86_zh_carrier.txt")  
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,Chinese,"nihao","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,Chinese,"nihao","CN"),"中国移动")
    }


    @TestCase
    func PrefixFileReader_04(): Unit {    
        
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber=phonenumberUtil.parse("18717619089", "CN")
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/86/86_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好","CN"),"China Mobile")
    }


    @TestCase
    func PrefixFileReader_05(): Unit {    
        
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber=phonenumberUtil.parse("02595566", "CN")
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/86/86_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"),"")
    }


    @TestCase
    func PrefixFileReader_06(): Unit {    
        
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber=phonenumberUtil.parse("12315", "CN")
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/86/86_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"),"")
    }

    @TestCase
    func PrefixFileReader_07(): Unit {    
        
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber=phonenumberUtil.parse("6502123456", "US")
        var prefixmapper :PrefixFileReader=PrefixFileReader("resources/1/1_en_carrier.txt")
        println(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"))
        @Assert(prefixmapper.getCarrierDescriptionForNumber(Phonenumber,English,"你好cangjie","CN"),"")      
    }

}
