package carrier

from std import sync.*
import libphonenumber.*
import libphonenumber.metadata.*
import libphonenumber.inter.*
import prefixmapper.*

public class PhoneNumberToCarrierMapper {

    private static let lock = ReentrantMutex()
    private static var instance: Option<PhoneNumberToCarrierMapper> = Option<PhoneNumberToCarrierMapper>.None
    private var phonePrefixDataDirectory: String = ""
    private let prefixFileReader: PrefixFileReader
    private let phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()

    init(phonePrefixDataDirectory: String) {
        prefixFileReader = PrefixFileReader(phonePrefixDataDirectory)
    }

    public static func getInstance(): Option<PhoneNumberToCarrierMapper> {
        synchronized(lock) {
            match (instance) {
                case None => 
                    instance = PhoneNumberToCarrierMapper(DefaultMetadataDependenciesProvider.getInstance().getCarrierDataDirectory())
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    public func getNameForValidNumber(number: PhoneNumber, languageCode: Language): String {
        let langStr: String = languageCode.getLanguage()
        let scriptStr: String = ""
        let regionStr: String = languageCode.getCountry()
        return prefixFileReader.getCarrierDescriptionForNumber(number, langStr, scriptStr, regionStr)
    }

    public func getNameForNumber(number: PhoneNumber, languageCode: Language): String {
        let numberType: PhoneNumberType = phoneUtil.getNumberType(number)
        if (isMobile(numberType)) {
            return getNameForValidNumber(number, languageCode)
        }
        return ""
    }

    public func getSafeDisplayName(number: PhoneNumber, languageCode: Language): String {
        if (phoneUtil.isMobileNumberPortableRegion(phoneUtil.getRegionCodeForNumber(number).getOrThrow())) {
            return ""
        }
        return getNameForNumber(number, languageCode)
    }

    private func isMobile(numberType: PhoneNumberType): Bool {
        return (numberType == PhoneNumberType.MOBILE || numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE|| numberType == PhoneNumberType.PAGER)
    }
    
}

public enum Language {

    English |
    Chinese |
    China |
    US

    public func getCountry(): String {
        return match (this) {
            case English => ""
            case Chinese => ""
            case China => "CN"
            case US => "US"
        }
    }

    public func getLanguage(): String {
        return match (this) {
            case English => "en"
            case Chinese => "zh"
            case China => "zh"
            case US => "en"
        }
    }

    public operator func == (that: Language): Bool {
        match ((this, that)) {
            case (English, English) => true
            case (Chinese, Chinese) => true
            case (China, China) => true
            case (US, US) => true
            case _ => false
        }
    }

    public operator func != (that: Language): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case English => "English"
            case Chinese => "Chinese"
            case China => "China"
            case US => "US"
        }
    }
}
