import Foundation

extension Bundle {
    /// SwiftMath's resource bundle (the math fonts).
    ///
    /// The `Bundle.module` accessor that `swift build` generates looks only at
    /// `Bundle.main.bundleURL/<name>.bundle`, which for an app is the `.app`
    /// root, and otherwise at an absolute build path. A file at the `.app` root
    /// is outside the code signature, so notarization rejects the app, and a
    /// sandboxed app cannot read the build path. Looking in
    /// `Bundle.main.resourceURL` first lets an app built with `swift build` ship
    /// the bundle in `Contents/Resources`, where it is signed. `Bundle.module`
    /// remains the fallback, so Xcode builds, tests and `swift run` are unchanged.
    static let swiftMath: Bundle = {
        if let url = Bundle.main.resourceURL?.appendingPathComponent("SwiftMath_SwiftMath.bundle"),
           let bundle = Bundle(url: url) {
            return bundle
        }
        return .module
    }()
}
