//
//  ViewController.h
//  AddressBook
//
//  Created by Rafael Ferreira on 12/14/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end