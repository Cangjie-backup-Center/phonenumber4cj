package libphonenumber.metadata

from std import io.*
from std import collection.*
import libphonenumber.inter.*

public class MetadataParser {

    private var strictMode: Bool

    private init(strictMode: Bool) {
        this.strictMode = strictMode
    }

    public static func newLenientParser(): MetadataParser {
        return MetadataParser(false)
    }

    public static func newStrictParser(): MetadataParser {
        return MetadataParser(true)
    }

    public func parse(source: ArrayList<String>): Collection<PhonemetadataPhoneMetadata> {
        if (source.isEmpty()) {
            return handleNullSource()
        }
        var phoneMetadataCollection: PhonemetadataPhoneMetadataCollection = PhonemetadataPhoneMetadataCollection()
        phoneMetadataCollection.readExternal(source)
        let phoneMetadata: ArrayList<PhonemetadataPhoneMetadata> = phoneMetadataCollection.getMetadataList()
        if (phoneMetadata.isEmpty()) {
            throw Exception("Empty metadata")
        }
        return phoneMetadataCollection.getMetadataList()
    }

    private func handleNullSource(): ArrayList<PhonemetadataPhoneMetadata> {
        if (strictMode) {
            throw IllegalArgumentException("Source cannot be null")
        }
        return ArrayList<PhonemetadataPhoneMetadata>()
    }

}
