import std.os.*
import std.fs.*

// Case of pre/post codes for 'cjpm build'.
/* called before `cjpm build`
 * Success: return 0
 * Error: return any number except 0
 */
func stagePreBuild(): Int64 {
    // process before "cjpm build"
    Directory.copy(Path("./resources"), Path("./target/release/phonenumber4cj/resources"), true)
    0
}

main(): Int64 {
    match (getArgs()[0]) {
        // Add operation here with format: "pre-"/"post-" + optionName
        case "pre-build" => stagePreBuild()
        case _ => 0
    }
}
