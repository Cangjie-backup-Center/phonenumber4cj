package libphonenumber.metadata

public interface RegionMetadataSource {
    func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata
}
