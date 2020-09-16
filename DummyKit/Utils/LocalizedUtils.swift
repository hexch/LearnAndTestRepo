import Foundation

extension String {
	var localized: String {
		Bundle.main.onLanguage()
		return NSLocalizedString(self, comment: self)
	}
    static var localized_login: String { return "login".localized }
    static var localized_logout: String { return "logout".localized }
    static var localized_darmode: String { return "darmode".localized }
    static var localized_lightmode: String { return "lightmode".localized }
    static var localized_ChoseLanguage: String { return "ChoseLanguage".localized }
    static var localized_Cancel: String { return "Cancel".localized }
    static var localized_English: String { return "English".localized }
    static var localized_Japanese: String { return "Japanese".localized }

}
