package libphonenumber.metadata

from std import io.*
import libphonenumber.inter.*

public class ClassPathResourceMetadataLoader <: MetadataLoader {
    public init() {}

    public func loadMetadata(metadataFileName: ArrayList<String>): ArrayList<String> {
        return metadataFileName
    }
}
