package libphonenumber.metadata

public interface NonGeographicalEntityMetadataSource {
    func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
