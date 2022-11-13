package libphonenumber.metadata

import libphonenumber.inter.*

public class MetadataSourceImpl <: MetadataSource {
    private let phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider
    private let bootstrappingGuard: MetadataBootstrappingGuard<CompositeMetadataContainer>

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<CompositeMetadataContainer>) {
        this.phoneMetadataFileNameProvider = phoneMetadataFileNameProvider
        this.bootstrappingGuard = bootstrappingGuard
    }

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser) {
        this(phoneMetadataFileNameProvider,
            BlockingMetadataBootstrappingGuard<CompositeMetadataContainer>(metadataLoader, metadataParser,
                CompositeMetadataContainer()))
    }

    public func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    public func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }
}
