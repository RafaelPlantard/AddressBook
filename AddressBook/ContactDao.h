//
//  ContactDao.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDao : NSObject

/*! @brief Sets the name. */
- (void) setName: (NSString *) newName;

/*! @brief Gets the name. */
- (NSString *) name;

/*! @brief Sets the address. */
- (void) setAddress:( NSString *) newAddress;

/*! @brief Gets the address. */
- (NSString *) address;

/*! @brief Sets the e-mail. */
- (void) setEMail:( NSString *) newEmail;

/*! @brief Gets the e-mail. */
- (NSString *) eMail;

/*! @brief Sets the phone. */
- (void) setPhone:( NSString *) newPhone;

/*! @brief Gets the phone. */
- (NSString *) phone;

/*! @brief Sets the website. */
- (void) setWebSite:( NSString *) newWebSite;

/*! @brief Gets the website. */
- (NSString *) webSite;

@end
