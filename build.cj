import std.fs.*
import std.process.*

// Case of pre/post codes for 'cjpm build'.
/* called before `cjpm build`
 * Success: return 0
 * Error: return any number except 0
 */
func stagePreBuild(): Int64 {
    // process before "cjpm build"
    copy(Path("./resources"), to: Path("./target/release/phonenumber4cj/resources"), overwrite: true)
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        // Add operation here with format: "pre-"/"post-" + optionName
        case "pre-build" => stagePreBuild()
        case _ => 0
    }
}