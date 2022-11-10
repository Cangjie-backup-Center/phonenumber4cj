package libphonenumber.metadata

import libphonenumber.inter.*

public interface RegionMetadataSource {
    func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata
}
