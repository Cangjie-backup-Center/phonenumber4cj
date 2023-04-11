package libphonenumber.inter

public interface MetadataLoader {
    func loadMetadata(metadataFileName: ArrayList<String>): ArrayList<String>
}
