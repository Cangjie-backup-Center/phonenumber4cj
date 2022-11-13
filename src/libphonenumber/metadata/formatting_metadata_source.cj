package libphonenumber.metadata

import libphonenumber.inter.*

public interface FormattingMetadataSource {
    func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
