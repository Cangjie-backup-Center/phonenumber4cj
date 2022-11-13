package libphonenumber.metadata

from std import io.*
import libphonenumber.inter.*

public class ClassPathResourceMetadataLoader <: MetadataLoader {
    public init() {}

    public func loadMetadata(metadataFileName: String): ArrayList<String> {
        return ArrayList<String>()
    }
}
