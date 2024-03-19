//
//  String+Ext.swift
//  Appetizers
//
//  Created by João Azevedo on 14.03.24.
//

import Foundation
import RegexBuilder

extension String {
    
    var isValidEmail: Bool {
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//		let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat as! CVarArg)
//		return emailPredicate.evaluate(with: self)
		
		let emailFormat = Regex {
			OneOrMore {
				CharacterClass(
					.anyOf("._%+-"),
					("A"..."Z"),
					("0"..."9"),
					("a"..."z")
				)
			}
			"@"
			OneOrMore {
				CharacterClass(
					.anyOf("-"),
					("A"..."Z"),
					("a"..."z"),
					("0"..."9")
				)
			}
			"."
			Repeat(2...64) {
				CharacterClass(
					("A"..."Z"),
					("a"..."z")
				)
			}
		}
		
		return self.wholeMatch(of: emailFormat) != nil
    }
}
