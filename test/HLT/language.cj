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
//enum Language   class PhoneNumberUtil   class DefaultMetadataDependenciesProvider

@Test
public class Language_01{

    @TestCase
    func Language_01(): Unit {

        var language :Language=Language.US
        println(language.getCountry())
        println(language.toString()=="English")
        println(language.toString())
        @Assert(language.getCountry(),"US")
        @Assert(language.toString()=="English",false)
        @Assert(language.toString(),"US")
    }


    @TestCase
    func Language_02(): Unit {

        var language :Language=Language.China 
        println(language.getCountry())
        println(language.toString()=="Chinese")
        println(language.toString())
        @Assert(language.getCountry(),"CN")
        @Assert(language.toString()=="China",true)
        @Assert(language.toString(),"China")
    }


    @TestCase
    func Language_03(): Unit {

        var language :Language=Language.English  
        println(language.getLanguage())
        println(language.toString()=="English")
        println(language.toString())
        @Assert(language.getLanguage(),"en")
        @Assert(language.toString()=="English",true)
        @Assert(language.toString(),"English")
    }


    @TestCase
    func Language_04(): Unit {

        var language :Language=Language.Chinese  
        println(language.getLanguage())
        println(language.toString()=="Chinese")
        println(language.toString())
        @Assert(language.getLanguage(),"zh")
        @Assert(language.toString()=="English",false)
        @Assert(language.toString(),"Chinese")
    }



    @TestCase
    func Language_05(): Unit {

        var language :Language=Language.Chinese  
        println(language.getLanguage())
        println(language.getCountry())
        @Assert(language.getLanguage(),"zh")
        @Assert(language.getCountry(),"")
    }




    @TestCase
    func IsmobileNumberportableRegion_06(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("02595566", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("仓颉"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_07(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("02595566", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_08(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("02595566", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("123456"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_09(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("02595566", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("$%#"),false)
    }



    @TestCase
    func IsmobileNumberportableRegion_10(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("02595566", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie仓颉123$%#"),false)
    }



    @TestCase
    func IsmobileNumberportableRegion_11(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("仓颉"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_12(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_13(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("123456"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_14(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("$%#"),false)
    }



    @TestCase
    func IsmobileNumberportableRegion_15(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie仓颉123$%#"),false)
    }



    @TestCase
    func IsmobileNumberportableRegion_16(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100","US",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("仓颉"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_17(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100","US",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_18(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100","US",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("123456"),false)
    }


    @TestCase
    func IsmobileNumberportableRegion_19(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100","US",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("$%#"),false)
    }



    @TestCase
    func IsmobileNumberportableRegion_20(): Unit {
        var Phonenumber: PhoneNumber = PhoneNumber()
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100","US",Phonenumber)
        @Assert(phonenumberUtil.isMobileNumberPortableRegion("cangjie仓颉123$%#"),false)
    }



    @TestCase
    func Language_21(): Unit {

        var language :Language=Language.Chinese
        var language1 :Language=Language.English    
        println(language.getDisplayCountryToCN())
        println(language.getDisplayCountryToUS())
        @Assert(language.getDisplayCountryToCN(),"中国")
        @Assert(language.getDisplayCountryToUS(),"美国")
        @Assert(language1==language,false)
        @Assert(language1!=language,true)
    }
}



