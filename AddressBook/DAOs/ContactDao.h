//
//  ContactDao.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/20/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactModel.h"

/* @brief The object that can be used to access the list of contacts and manipulate it. */
@interface ContactDao : NSObject

/*! @brief Add a new contact */
- (void) addContact : (ContactModel *) contact;

/*! @brief Returns a contact that exists in a specific position at the list */
- (ContactModel *) contactAtIndex : (NSInteger) index;

/*! */
- (NSInteger) indexByContact : (ContactModel *) contact;

/*! @brief Generates a single instance of this DAO. */
+ (id) instance;

/*! @brief Removes a specific contact. */
- (void) removeContact : (ContactModel *) contact;

/*! @brief Gets the total of contact added in the list */
- (NSInteger) total;

@end