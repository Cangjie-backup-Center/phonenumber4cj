package libphonenumber.inter

from std import io.*
from std import collection.*

public interface MetadataLoader {
    func loadMetadata(metadataFileName: String): ArrayList<String>
}
