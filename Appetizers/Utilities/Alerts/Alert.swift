//
//  Alert.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server-Fehler"),
                                       message: Text("Daten aus dem Server ungültig. Wenden Sie sich bitte an den Support."),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server-Fehler"),
                                           message: Text("Antwort aus dem Server ungültig. Versuchen Sie bitte später oder wenden Sie sich an den Support"),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: Text("Server-Fehler"),
                                      message: Text("Bei der Verbindung mit dem Server ist ein Problem aufgetreten. Sollte das Problem länger bestehen, wenden Sie sich bitte an den Support."),
                                      dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server-Fehler"),
                                            message: Text("Anfrage konnte nicht durchgeführt werden. Überprüfen Sie bitte Ihre Internetverbindung."),
                                            dismissButton: .default(Text("Ok")))
    
    //MARK: - Account Alerts
    
    static let missingInput = AlertItem(title: Text("Fehlende Eingabe"),
                                            message: Text("Eingabefeld(er) leer."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Ungültige Email-Adresse"),
                                            message: Text("Bitte geben Sie eine gültige Email ein"),
                                            dismissButton: .default(Text("Ok")))
    
    static let userSavedSucess = AlertItem(title: Text("Nutzer gespeichert"),
                                            message: Text("Das Nutzerprofil wurde gespeichert"),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidUserData = AlertItem(title: Text("Profil-Fehler"),
                                            message: Text("Beim Speichern oder Aufrufen eines Nutzers ist ein Fehler unterlaufen"),
                                            dismissButton: .default(Text("Ok")))
}
