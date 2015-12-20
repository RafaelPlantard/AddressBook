//
//  ContactDao.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDao : NSObject

/*! @brief Get and sets the name. */
@property NSString *name;

/*! @brief Gets and sets the address. */
@property NSString *address;

/*! @brief Gets and sets the e-mail. */
@property NSString *eMail;

/*! @brief Get and sets the phone. */
@property NSString *phone;

/*! @brief Get and sets the website. */
@property NSString *webSite;

@end
