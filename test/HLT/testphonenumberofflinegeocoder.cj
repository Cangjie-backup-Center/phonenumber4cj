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
from phonenumber4cj import geocoder.geocoding.*
from phonenumber4cj import geocoder.*






//提供地理位置、时区、运营商相关信息查询功能  查找指定电话号码中的地理位置信息(top2)
//class PrefixFileReader

@Test
public class PhoneNumberOfflineGeocoderTest{


  
    @TestCase
    func PhoneNumberOfflineGeocoder_01(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, China)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, China,"cangjie") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, China)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, China,"cangjie")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"江苏省南京市")           
        @Assert(ForValidNumber1,"中国")     
        @Assert(ForNumber,"江苏省南京市")                     
        @Assert(ForNumber2,"中国") 
    }



    @TestCase
    func PhoneNumberOfflineGeocoder_02(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, China)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, China,"cangjie") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, China)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, China,"cangjie")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"陕西省榆林市")              
        @Assert(ForValidNumber1,"中国")     
        @Assert(ForNumber,"陕西省榆林市")                     
        @Assert(ForNumber2,"中国") 
    }

    //@Skip
    @TestCase
    func PhoneNumberOfflineGeocoder_03(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("110", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, China)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, China,"cangjie") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, China)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, China,"cangjie")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"中国")              
        @Assert(ForValidNumber1,"中国")     
        @Assert(ForNumber,"")                     
        @Assert(ForNumber2,"") 
    }

    //@Skip
    @TestCase
    func PhoneNumberOfflineGeocoder_04(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("110120", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, China)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, China,"cangjie") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, China)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, China,"cangjie")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"中国")              
        @Assert(ForValidNumber1,"中国")     
        @Assert(ForNumber,"")                     
        @Assert(ForNumber2,"") 
    }



    @TestCase
    func PhoneNumberOfflineGeocoder_05(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "US")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, China)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, China,"cangjie") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, China)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, China,"cangjie")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"美国")              
        @Assert(ForValidNumber1,"美国")     
        @Assert(ForNumber,"美国")                     
        @Assert(ForNumber2,"美国") 
    }



    @TestCase
    func PhoneNumberOfflineGeocoder_06(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "US")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, English)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, English,"仓颉") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, English)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, English,"仓颉")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"")                      
        @Assert(ForValidNumber1,"")     
        @Assert(ForNumber,"")                     
        @Assert(ForNumber2,"") 
    }

  
    @TestCase
    func PhoneNumberOfflineGeocoder_07(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("+14255550100", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, English)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, English,"仓颉") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, English)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, English,"仓颉")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"Washington State")                    
        @Assert(ForValidNumber1,"United States")     
        @Assert(ForNumber,"Washington State")                     
        @Assert(ForNumber2,"United States") 
    }



    @TestCase
    func PhoneNumberOfflineGeocoder_08(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, Chinese)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, Chinese,"仓颉123") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, Chinese)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, Chinese,"仓颉123")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"陕西省榆林市")                    
        @Assert(ForValidNumber1,"中国")     
        @Assert(ForNumber,"陕西省榆林市")                     
        @Assert(ForNumber2,"中国") 
    }


  
    @TestCase
    func PhoneNumberOfflineGeocoder_09(): Unit {
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
        var ForValidNumber = p.getDescriptionForValidNumber(phoneNumber1, US)
        var ForValidNumber1 = p.getDescriptionForValidNumber(phoneNumber1, US,"仓颉123#%^") 
        var ForNumber = p.getDescriptionForNumber(phoneNumber1, US)
        var ForNumber2 = p.getDescriptionForNumber(phoneNumber1, US,"仓颉123#%^")
        println(ForValidNumber)
        println(ForValidNumber1)
        println(ForNumber)  
        println(ForNumber2)
        @Assert(ForValidNumber,"Yulin, Shaanxi")                   
        @Assert(ForValidNumber1,"China")      
        @Assert(ForNumber,"Yulin, Shaanxi")                     
        @Assert(ForNumber2,"China")  
    }



    @TestCase
    func PhoneNumberUtil_10(): Unit {

    
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(12)
        println(mobiletoken)
        @Assert(mobiletoken,"") 
    }

 
    @TestCase
    func PhoneNumberUtil_11(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("+14255550100", "CN")
        var getRegion = phonenumberUtil.getRegionCodesForCountryCode(12)
        var isNumber = phonenumberUtil.isNumberGeographical(PhoneNumberType.MOBILE,12)
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(12)
        println(getRegion)
        println(isNumber)
        println(mobiletoken)
        @Assert(getRegion.toString(),"[]") 
        @Assert(isNumber,false) 
        @Assert(mobiletoken,"") 
    }



    @TestCase
    func PhoneNumberUtil_12(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        phonenumberUtil.parse("18717619089", "CN")
        var getRegion = phonenumberUtil.getRegionCodesForCountryCode(12)
        var isNumber = phonenumberUtil.isNumberGeographical(PhoneNumberType.MOBILE,12)
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(12)
        println(getRegion)
        println(isNumber)
        println(mobiletoken)
        @Assert(getRegion.toString(),"[]") 
        @Assert(isNumber,false) 
        @Assert(mobiletoken,"") 
    }


    @TestCase
    func PhoneNumberUtil_13(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var getRegion = phonenumberUtil.getRegionCodesForCountryCode(0)
        var isNumber = phonenumberUtil.isNumberGeographical(PhoneNumberType.FIXED_LINE,0)
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(0)
        println(getRegion)
        println(isNumber)
        println(mobiletoken)
        @Assert(getRegion.toString(),"[]") 
        @Assert(isNumber,true) 
        @Assert(mobiletoken,"") 
    }


    @TestCase
    func PhoneNumberUtil_14(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var getRegion = phonenumberUtil.getRegionCodesForCountryCode(-2147483648)
        var isNumber = phonenumberUtil.isNumberGeographical(PhoneNumberType.FIXED_LINE_OR_MOBILE,-2147483648)
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(-2147483648)
        println(getRegion)
        println(isNumber)
        println(mobiletoken)
        @Assert(getRegion.toString(),"[]") 
        @Assert(isNumber,true) 
        @Assert(mobiletoken,"") 
    }



    @TestCase
    func PhoneNumberUtil_15(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var getRegion = phonenumberUtil.getRegionCodesForCountryCode(2147483647)
        var isNumber = phonenumberUtil.isNumberGeographical(PhoneNumberType.PERSONAL_NUMBER,2147483647)
        var mobiletoken = PhoneNumberUtil.getCountryMobileToken(2147483647)
        println(getRegion)
        println(isNumber)
        println(mobiletoken)
        @Assert(getRegion.toString(),"[]") 
        @Assert(isNumber,false) 
        @Assert(mobiletoken,"") 
    }



    @TestCase
    func PrefixFileReader_16(): Unit {
        try{
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var PrefixFile:PrefixFileReader=PrefixFileReader("nihao")
        PrefixFile.getGeoDescriptionForNumber(phoneNumber1,China,"cangjie","CN")             
        } catch (e: Exception) {
            @Assert(e.toString(),"FSException: The file does not exist or permission denied!")
        }
    }



    @TestCase
    func PrefixFileReader_17(): Unit {
   
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/86/86_en_geo.txt")
        var getRegion = PrefixFile.getGeoDescriptionForNumber(phoneNumber1,English,"仓颉","CN")                
        println(getRegion)
        @Assert(getRegion,"Yulin, Shaanxi") 
    }


    @TestCase
    func PrefixFileReader_18(): Unit {
   
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/1/1_en_geo.txt")
        var getRegion = PrefixFile.getGeoDescriptionForNumber(phoneNumber1,English,"仓颉","CN")                 
        println(getRegion)
        @Assert(getRegion,"")            
    }


 
    @TestCase
    func PrefixFileReader_19(): Unit {
   
        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("14255550100", "US")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/1/1_en_geo.txt")
        var getRegion = PrefixFile.getGeoDescriptionForNumber(phoneNumber1,China,"仓颉","US")               
        println(getRegion)
        @Assert(getRegion,"") 
    }



 
    @TestCase
    func PhoneNumberToCarrierMapper_20(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "US")
        var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
        println(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China))
        @Assert(phoneNumbertocarriermapper.getNameForValidNumber(phoneNumber1,China),"")   
    }
 

//时区查询

    @TestCase
    func PhoneNumberToTimeZonesMapper_21(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("18717619089", "CN")
        var ZonesMapper:PhoneNumberToTimeZonesMapper=PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
        println("12")
        println(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1))
        println(ZonesMapper.getTimeZonesForNumber(phoneNumber1))
        println(PhoneNumberToTimeZonesMapper.getUnknownTimeZone())
        @Assert(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1).toString(),"[Asia/Shanghai]")
        @Assert(ZonesMapper.getTimeZonesForNumber(phoneNumber1).toString(),"[Asia/Shanghai]")
        @Assert(PhoneNumberToTimeZonesMapper.getUnknownTimeZone().toString(),"Etc/Unknown")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/tz/map_data.txt")
        println(PrefixFile.lookupTimeZonesForNumber(phoneNumber1)) 
        @Assert(PrefixFile.lookupTimeZonesForNumber(phoneNumber1).toString(),"[Asia/Shanghai]")  
    }



    @TestCase
    func PhoneNumberToTimeZonesMapper_22(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("14255550100", "US")
        var ZonesMapper:PhoneNumberToTimeZonesMapper=PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
        println("12")
        println(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1))
        println(ZonesMapper.getTimeZonesForNumber(phoneNumber1))
        println(PhoneNumberToTimeZonesMapper.getUnknownTimeZone())
        @Assert(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1).toString(),"[America/Los_Angeles]")
        @Assert(ZonesMapper.getTimeZonesForNumber(phoneNumber1).toString(),"[America/Los_Angeles]")
        @Assert(PhoneNumberToTimeZonesMapper.getUnknownTimeZone().toString(),"Etc/Unknown")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/tz/map_data.txt")
        println(PrefixFile.lookupTimeZonesForNumber(phoneNumber1)) 
        @Assert(PrefixFile.lookupTimeZonesForNumber(phoneNumber1).toString(),"[America/Los_Angeles]")  
    }


    @TestCase
    func PhoneNumberToTimeZonesMapper_23(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("14255550100", "US")
        var ZonesMapper:PhoneNumberToTimeZonesMapper=PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
        println("12")
        println(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1))
        println(ZonesMapper.getTimeZonesForNumber(phoneNumber1))
        println(PhoneNumberToTimeZonesMapper.getUnknownTimeZone())
        @Assert(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1).toString(),"[America/Los_Angeles]")
        @Assert(ZonesMapper.getTimeZonesForNumber(phoneNumber1).toString(),"[America/Los_Angeles]")
        @Assert(PhoneNumberToTimeZonesMapper.getUnknownTimeZone().toString(),"Etc/Unknown")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/tz/map_data.txt")
        println(PrefixFile.lookupTimeZonesForNumber(phoneNumber1)) 
        @Assert(PrefixFile.lookupTimeZonesForNumber(phoneNumber1).toString(),"[America/Los_Angeles]")  
    }

  
    @TestCase
    func PhoneNumberToTimeZonesMapper_24(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("14255550100", "CN")
        var ZonesMapper:PhoneNumberToTimeZonesMapper=PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
        println("12")
        println(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1))
        println(ZonesMapper.getTimeZonesForNumber(phoneNumber1))
        println(PhoneNumberToTimeZonesMapper.getUnknownTimeZone())
        @Assert(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1).toString(),"[Asia/Shanghai]")
        @Assert(ZonesMapper.getTimeZonesForNumber(phoneNumber1).toString(),"[Etc/Unknown]")                 
        @Assert(PhoneNumberToTimeZonesMapper.getUnknownTimeZone().toString(),"Etc/Unknown")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/tz/map_data.txt")
        println(PrefixFile.lookupTimeZonesForNumber(phoneNumber1)) 
        @Assert(PrefixFile.lookupTimeZonesForNumber(phoneNumber1).toString(),"[Asia/Shanghai]")  
    }



    @TestCase
    func PhoneNumberToTimeZonesMapper_25(): Unit {

        var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phoneNumber1=phonenumberUtil.parse("02595566", "CN")
        var ZonesMapper:PhoneNumberToTimeZonesMapper=PhoneNumberToTimeZonesMapper.getInstance().getOrThrow()
        println("12")
        println(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1))
        println(ZonesMapper.getTimeZonesForNumber(phoneNumber1))
        println(PhoneNumberToTimeZonesMapper.getUnknownTimeZone())
        @Assert(ZonesMapper.getTimeZonesForGeographicalNumber(phoneNumber1).toString(),"[Asia/Shanghai]")
        @Assert(ZonesMapper.getTimeZonesForNumber(phoneNumber1).toString(),"[Asia/Shanghai]")                
        @Assert(PhoneNumberToTimeZonesMapper.getUnknownTimeZone().toString(),"Etc/Unknown")
        var PrefixFile:PrefixFileReader=PrefixFileReader("resources/tz/map_data.txt")
        println(PrefixFile.lookupTimeZonesForNumber(phoneNumber1)) 
        @Assert(PrefixFile.lookupTimeZonesForNumber(phoneNumber1).toString(),"[Asia/Shanghai]")  
    }

} 
