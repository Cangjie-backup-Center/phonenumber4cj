/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.carrier

import std.sync.*
import phonenumber4cj.libphonenumber.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.prefixmapper.*

public class PhoneNumberToCarrierMapper {

    private static let lock = Mutex()
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
