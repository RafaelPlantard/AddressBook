//
//  ContactListViewController.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/19/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Contact.h"
#import "ContactDao.h"
#import "ViewController.h"

/*! @brief Represents the View for show the list of contacts that the user already added. */
@interface ContactListViewController : UITableViewController<ViewControllerDelegate>

/*! @brief The data access object for the contact list. */
@property ContactDao *contactDao;

@end	