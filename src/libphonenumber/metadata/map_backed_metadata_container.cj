package libphonenumber.metadata

from std import collection.*
import libphonenumber.inter.*

public class MapBackedMetadataContainer<T> <: MetadataContainer where T <: Hashable & Equatable<T> {
    static func byRegionCode(): MapBackedMetadataContainer<String> {
        return MapBackedMetadataContainer<String>(KeyProviderImpString())
    }

    static func byCountryCallingCode(): MapBackedMetadataContainer<Int32> {
        return MapBackedMetadataContainer<Int32>(KeyProviderImpInt32())
    }

    private let metadataMap: HashMap<T, PhonemetadataPhoneMetadata>
    private let keyProvider: KeyProvider<T>

    private init(keyProvider: KeyProvider<T>) {
        this.metadataMap = HashMap<T, PhonemetadataPhoneMetadata>()
        this.keyProvider = keyProvider
    }

    func getMetadataBy(key: T): Option<PhonemetadataPhoneMetadata> {
        return Option<PhonemetadataPhoneMetadata>.None
    }

    func getKeyProvider(): KeyProvider<T> {
        return keyProvider
    }

    public func accept(PhonemetadataPhoneMetadata: PhonemetadataPhoneMetadata): Unit {}
}

public interface KeyProvider<T> {
    func getKeyOf(phoneMetadata: PhonemetadataPhoneMetadata): T
}

public class KeyProviderImpString <: KeyProvider<String> {
    public func getKeyOf(phoneMetadata: PhonemetadataPhoneMetadata): String {
        return phoneMetadata.getId()
    }
}

public class KeyProviderImpInt32 <: KeyProvider<Int32> {
    public func getKeyOf(phoneMetadata: PhonemetadataPhoneMetadata): Int32 {
        return phoneMetadata.getCountryCode()
    }
}
