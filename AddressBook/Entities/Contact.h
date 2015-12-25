//
//  ContactDao.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Contact : MTLModel<MTLJSONSerializing>

/*! @brief Contact identifier. */
@property (nonatomic, readonly) NSString *objectId;

/*! @brief Date that this object was created. */
@property (nonatomic, readonly) NSDate *createdAt;

/*! @brief Last update on object. */
@property (nonatomic, readonly) NSDate *updatedAt;

/*! @brief Get and sets the name. */
@property (nonatomic, copy) NSString *name;

/*! @brief Gets and sets the address. */
@property (nonatomic, copy) NSString *address;

/*! @brief Gets and sets the e-mail. */
@property (nonatomic, copy) NSString *eMail;

/*! @brief Get and sets the phone. */
@property (nonatomic, copy) NSString *phone;

/*! @brief Get and sets the website. */
@property (nonatomic, copy) NSString *webSite;

@end
