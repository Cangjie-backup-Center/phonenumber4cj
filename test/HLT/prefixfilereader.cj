//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from std import sync.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.metadata.*



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
