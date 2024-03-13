#!/usr/bin/swift

import Foundation

var users = ["feyyaz", "Mert", "süleyman", "Barış", "Merve", "doğukan", "ADEM", "zAfer"]

users.sort { $0.lowercased() > $1.lowercased() }

for user in users {
    print(user.uppercased())
}
