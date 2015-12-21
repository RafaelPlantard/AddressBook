//
//  ContactListViewController.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/19/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDao.h"

/*! @brief Represents the View for show the list of contacts that the user already added. */
@interface ContactListViewController : UITableViewController

/*! @brief The data access object for the contact list. */
@property ContactDao *contactDao;

@end	