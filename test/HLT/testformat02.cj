//3rd_party_lib:phonenumber4cj/build/phonenumber4cj
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.internal.*
@Test
public class phoneNumber_MetadataSourceImpl {


    @TestCase
    func phoneNumber_MetadataSourceImpl_1(): Unit {
        var expect=###"[1, true, true, (?:268|[58]\d\d|900)\d{7}, 1, 10, 1, 7, false, true, true, 268(?:4(?:6[0-38]|84)|56[0-2])\d{4}, 0, 1, 7, true, 2684601234, true, true, 268(?:464|7(?:1[3-9]|[28]\d|3[0246]|64|7[0-689]))\d{4}, 0, 1, 7, true, 2684641234, true, true, 8(?:00|33|44|55|66|77|88)[2-9]\d{6}, 0, 0, true, 8002123456, true, true, 900[2-9]\d{6}, 0, 0, true, 9002123456, true, false, 1, -1, 0, false, true, true, 52(?:3(?:[2-46-9][02-9]\d|5(?:[02-46-9]\d|5[0-46-9]))|4(?:[2-478][02-9]\d|5(?:[034]\d|2[024-9]|5[0-46-9])|6(?:0[1-9]|[2-9]\d)|9(?:[05-9]\d|2[0-5]|49)))\d{4}|52[34][2-9]1[02-9]\d{4}|5(?:00|2[125-7]|33|44|66|77|88)[2-9]\d{6}, 0, 0, true, 5002345678, true, true, 26848[01]\d{4}, 0, 1, 7, true, 2684801234, true, true, 26840[69]\d{4}, 0, 1, 7, true, 2684061234, true, false, 1, -1, 0, false, false, true, false, 1, -1, 0, false, false, false, false, false, true, false, 1, -1, 0, false, AG, 1, 011, false, true, 1, false, true, 1|([457]\d{6})$, true, 268$1, false, 0, 0, false, true, 268, false, true]"###
        let metadata: MultiFileModeFileNameProvider = MultiFileModeFileNameProvider(PHONE_NUMBER_METADATA_MAP)
        metadata.getFor("AG")
        @Assert( metadata.getFor("AG").toString(),expect)
    }


    @TestCase
    func phoneNumber_MetadataSourceImpl_2(): Unit {
        try{
        let metadata: MultiFileModeFileNameProvider = MultiFileModeFileNameProvider(PHONE_NUMBER_METADATA_MAP)
        metadata.getFor("SH")
        @Assert( metadata.getFor("CN").toString(),"+1-213-282-3146")
        } catch (e: Exception) {
        @Assert(e.message, "Invalid key: SH")
    }
    }

    @TestCase
    func phoneNumber_MetadataSourceImpl_3(): Unit {
        let Map: KeyProviderImpString= KeyProviderImpString()
        let phone: PhonemetadataPhoneMetadata=PhonemetadataPhoneMetadata()
        Map.getKeyOf(phone)
        @Assert(Map.getKeyOf(phone), "")
    }


    @TestCase
    func phoneNumber_MetadataSourceImpl_4(): Unit {
         var expect=###"[1, true, true, (?:268|[58]\d\d|900)\d{7}, 1, 10, 1, 7, false, true, true, 268(?:4(?:6[0-38]|84)|56[0-2])\d{4}, 0, 1, 7, true, 2684601234, true, true, 268(?:464|7(?:1[3-9]|[28]\d|3[0246]|64|7[0-689]))\d{4}, 0, 1, 7, true, 2684641234, true, true, 8(?:00|33|44|55|66|77|88)[2-9]\d{6}, 0, 0, true, 8002123456, true, true, 900[2-9]\d{6}, 0, 0, true, 9002123456, true, false, 1, -1, 0, false, true, true, 52(?:3(?:[2-46-9][02-9]\d|5(?:[02-46-9]\d|5[0-46-9]))|4(?:[2-478][02-9]\d|5(?:[034]\d|2[024-9]|5[0-46-9])|6(?:0[1-9]|[2-9]\d)|9(?:[05-9]\d|2[0-5]|49)))\d{4}|52[34][2-9]1[02-9]\d{4}|5(?:00|2[125-7]|33|44|66|77|88)[2-9]\d{6}, 0, 0, true, 5002345678, true, true, 26848[01]\d{4}, 0, 1, 7, true, 2684801234, true, true, 26840[69]\d{4}, 0, 1, 7, true, 2684061234, true, false, 1, -1, 0, false, false, true, false, 1, -1, 0, false, false, false, false, false, true, false, 1, -1, 0, false, AG, 1, 011, false, true, 1, false, true, 1|([457]\d{6})$, true, 268$1, false, 0, 0, false, true, 268, false, true]"###
        let metadata: MultiFileModeFileNameProvider = MultiFileModeFileNameProvider(PHONE_NUMBER_METADATA_MAP)
        let arr = metadata.getFor("AG")
        let metadataLoader: ClassPathResourceMetadataLoader = ClassPathResourceMetadataLoader()
        let fmci: FormattingMetadataSourceImpl= FormattingMetadataSourceImpl(metadata, metadataLoader, MetadataParser.newStrictParser())
        fmci.getFormattingMetadataForCountryCallingCode(11)
        metadataLoader.loadMetadata(arr)
        @Assert(metadataLoader.loadMetadata(arr).toString(), expect)
    }



     @TestCase
     func phoneNumber_MetadataSourceImpl_5(): Unit {
         let phone: PhonemetadataPhoneMetadata  = PhonemetadataPhoneMetadata ()
         let Map: KeyProviderImpString= KeyProviderImpString()
         phone.setCountryCode(20)
         phone.setPreferredInternationalPrefix("nihapo")
         phone.setNationalPrefix("nihapo")
         phone.setNationalPrefixForParsing("nihapo")
         phone.setSameMobileAndFixedLinePattern(true)
         phone.setId("nihapo")
         phone.setInternationalPrefix("nihapo")
         @Assert(Map.getKeyOf(phone.setPreferredInternationalPrefix("nihapo")), "nihapo")
         @Assert(Map.getKeyOf(phone.setNationalPrefix("nihapo")), "nihapo")
         @Assert(Map.getKeyOf(phone.setPreferredInternationalPrefix("nihapo")), "nihapo")
         @Assert(Map.getKeyOf(phone.setSameMobileAndFixedLinePattern(true)), "nihapo")
     }



     @TestCase
     func phoneNumber_MetadataSourceImpl_6(): Unit {
         let phone: PhonemetadataPhoneMetadata  = PhonemetadataPhoneMetadata ()
         let Map: KeyProviderImpString= KeyProviderImpString()
         phone.setCountryCode(20)
         phone.setPreferredInternationalPrefix("你好")
         phone.setNationalPrefix("你好")
         phone.setNationalPrefixForParsing("你好")
         phone.setSameMobileAndFixedLinePattern(true)
         phone.setId("你好")
         phone.setInternationalPrefix("你好")
         @Assert(Map.getKeyOf(phone.setPreferredInternationalPrefix("nihapo")), "你好")
         @Assert(Map.getKeyOf(phone.setNationalPrefix("nihapo")), "你好")
         @Assert(Map.getKeyOf(phone.setPreferredInternationalPrefix("nihapo")), "你好")
         @Assert(Map.getKeyOf(phone.setSameMobileAndFixedLinePattern(true)), "你好")
     }



      @TestCase
      func phoneNumber_MetadataSourceImpl_7(): Unit {
      var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
      var buil = StringBuilder()
      phonenumberUtil.getCountryCodeForRegion("nihao")
      phonenumberUtil.buildNationalNumberForParsing("String",buil)
      @Assert(phonenumberUtil.getCountryCodeForRegion("nihao"), 0)
     }


      @TestCase
      func phoneNumber_MetadataSourceImpl_8(): Unit {
      var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
      var buil = StringBuilder()
      phonenumberUtil.getCountryCodeForRegion("你好")
      phonenumberUtil.buildNationalNumberForParsing("String",buil)
      @Assert(phonenumberUtil.getCountryCodeForRegion("nihao"), 0)
     }


    @TestCase
    func phoneNumber_MetadataSourceImpl_9(): Unit {
    let rbm = RegexBasedMatcher.create()
    var region=rbm.matchNationalNumber("121132", PhonemetadataPhoneNumberDesc(), false)
    @Assert(region, false)
    }


    @TestCase
    func phoneNumber_MetadataSourceImpl_10(): Unit {
    let rbm = RegexBasedMatcher.create()
    var region=rbm.matchNationalNumber("你好", PhonemetadataPhoneNumberDesc(), true)
    @Assert(region, false)
    }


}


