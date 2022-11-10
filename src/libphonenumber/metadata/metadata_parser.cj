package libphonenumber.metadata

from std import io.*
from std import collection.*
import libphonenumber.inter.*

public class MetadataParser {
    public static func newLenientParser(): MetadataParser {
        return MetadataParser(false)
    }

    public static func newStrictParser(): MetadataParser {
        return MetadataParser(true)
    }

    private let strictMode: Bool = false

    private init(strictMode: Bool) {}

    public func parse(source: ArrayList<String>): Collection<PhonemetadataPhoneMetadata> {
        return ArrayList<PhonemetadataPhoneMetadata>()
    }

    private func handleNullSource(): ArrayList<PhonemetadataPhoneMetadata> {
        return ArrayList<PhonemetadataPhoneMetadata>()
    }

    private func close(inputStream: InputStream): Unit {}
}
