package libphonenumber.metadata

import libphonenumber.inter.*

public interface MetadataContainer {
    func accept(phoneMetadata: PhonemetadataPhoneMetadata): Unit
}
