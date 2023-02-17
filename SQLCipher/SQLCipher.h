//
//  SQLCipher.h
//  SQLCipher
//
//  Created by Dominik Kapusta on 17/02/2023.
//

#import <Foundation/Foundation.h>

//! Project version number for SQLCipher.
FOUNDATION_EXPORT double SQLCipherVersionNumber;

//! Project version string for SQLCipher.
FOUNDATION_EXPORT const unsigned char SQLCipherVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SQLCipher/PublicHeader.h>

#import <SQLCipher/sqlite3.h>
#import <SQLCipher/SQLCipher_config.h>
