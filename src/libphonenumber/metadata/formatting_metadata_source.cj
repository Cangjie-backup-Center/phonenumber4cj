package libphonenumber.metadata

public interface FormattingMetadataSource {
    
    func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
