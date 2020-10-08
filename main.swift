
import Foundation

extension Character {
    func utf8() -> UInt8 {
        let utf8 = String(self).utf8
        return utf8[utf8.startIndex]
    }
}

func encryptDecrypt(_ input: String) -> String {
    // MARK: Change key here
    let key = "KEY_VALUE".map { $0 }
    var output = ""
    var keyIndex = 0
    for i in input.enumerated() {
        let byte = [i.element.utf8() ^ key[keyIndex].utf8()]
        keyIndex += 1
        if keyIndex >= key.count{
            keyIndex = 0
        }
        guard let sss = String(bytes: byte, encoding: .utf8) else { continue }
        output.append(sss)
    }
    
    return output
}

func main() {
    print("Input string to be encrypted/decrypted")
    guard let str = readLine() else { return }
    let result = encryptDecrypt(str)
    print("encrypt=", result)
    let results = encryptDecrypt(result)
    print("decrypt=", results)
}

main()
