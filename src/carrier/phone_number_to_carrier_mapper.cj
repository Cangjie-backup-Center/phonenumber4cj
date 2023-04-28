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
                    instance = PhoneNumberToCarrierMapper("")
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    public func getNameForValidNumber(number: PhoneNumber, languageCode: Language): String {
        let scriptStr: String = ""
        let regionStr: String = languageCode.getCountry()
        return prefixFileReader.getCarrierDescriptionForNumber(number, languageCode, scriptStr, regionStr)
    }

    public func getNameForNumber(number: PhoneNumber, languageCode: Language): String {
        let numberType: PhoneNumberType = phoneUtil.getNumberType(number)
        if (isMobile(numberType)) {
            return getNameForValidNumber(number, languageCode)
        }
        return ""
    }

    public func getSafeDisplayName(number: PhoneNumber, languageCode: Language): String {
        let opt = match(phoneUtil.getRegionCodeForNumber(number)) {
            case Some(v) => v
            case None => ""
        }
        if (phoneUtil.isMobileNumberPortableRegion(opt)) {
            return ""
        }
        return getNameForNumber(number, languageCode)
    }

    private func isMobile(numberType: PhoneNumberType): Bool {
        return (numberType == PhoneNumberType.MOBILE || numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE|| numberType == PhoneNumberType.PAGER)
    }
    
}
