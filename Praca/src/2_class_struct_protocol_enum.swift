// struktura - typ wartościowy
struct UserInfo {
    let name: String
    let identifier: Int
}
// typ wyliczeniowy
enum ScreenResolution {
    case SD
    case HD
    case FullHD
}
// protokół - obiekt definiujący interfejs klasy/struktury go implementującej
protocol UserInfoDrawer {
    func drawUserInfo(info: UserInfo) -> Void
}
// klasa - typ referencyjny
class TerminalUserInfoDrawer: UserInfoDrawer {
    var screenResolution: ScreenResolution = .FullHD
    
    func drawUserInfo(info: UserInfo) -> Void {
        // .. implementacja wyświetlania informacji o użytkowniku
    }
}
