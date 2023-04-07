package libphonenumber.internal

public interface MatcherApi {
    func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool
}
