package libphonenumber.internal

import libphonenumber.inter.*

public interface MatcherApi {
    func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool
}
