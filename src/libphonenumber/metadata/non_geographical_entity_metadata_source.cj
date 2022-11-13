package libphonenumber.metadata

import libphonenumber.inter.*

public interface NonGeographicalEntityMetadataSource {
    func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
