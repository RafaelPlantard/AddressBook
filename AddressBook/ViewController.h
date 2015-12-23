//
//  ViewController.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/14/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContactDao.h"

/*! @brief Delegate to alert view controllers that we add or edit a specific contact. */
@protocol ViewControllerDelegate <NSObject>

@required
/*! @brief It will alert the list that a specific contact was added. */
- (void) setAddedContact: (Contact *) contact;

/*! @brief It will alert the list that a specific contact was changed. */
- (void) setUpdatedContact: (Contact *) contact;

@end

/*! @brief Responsible for get the data to add or edit a contact in the contact list. */
@interface ViewController : UIViewController

/*! @brief Represents the field for get the name of a new contact. */
@property (weak, nonatomic) IBOutlet UITextField *nameField;

/*! @brief Represents the field for get the address of a new contact. */
@property (weak, nonatomic) IBOutlet UITextField *addressField;

/*! @brief Represents the field for get the e-mail address of a new contact. */
@property (weak, nonatomic) IBOutlet UITextField *eMailField;

/*! @brief Represents the field for get the mobile phone of a new contact. */
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

/*! @brief Represents the field for get the web site of a new contact. */
@property (weak, nonatomic) IBOutlet UITextField *webSiteField;

/*! @brief A instace of a DAO to manipulate the contact on the app. */
@property ContactDao *contactDao;

/*! @brief The selected contact to editing scope. */
@property Contact *contactToWork;

/*! @brief A delegate that process some actions when I add or update a contact. */
@property id<ViewControllerDelegate> delegate;

@end