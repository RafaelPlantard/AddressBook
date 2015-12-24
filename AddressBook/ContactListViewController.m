//
//  ContactListViewController.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/19/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactListViewController.h"

@implementation ContactListViewController

/*! @brief The reuse identifier for the contact list. */
NSString *contactListReuseIdentifier = @"ContactListReuseId";

/*! @brief Selected contact for editing. */
Contact *selectedContact;

/*! @brief Represents the line of the table that it was changed (added or updated). */
NSInteger lastIndexChanged;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contact *contactToDelete = [self.contactDao contactAtIndex:indexPath.row];
        
        [self.contactDao removeContact:contactToDelete];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*! @brief Go to the ViewController that contains the form for add a new contact */
- (void) goToAddViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"AddContactForm"];
    
    viewController.contactToWork = selectedContact;
    viewController.delegate = self;
    
    selectedContact = nil;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (id) init {
    self = [super init];
    
    if (self) {
        UIBarButtonItem *addContactButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddViewController)];
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.navigationItem.rightBarButtonItem = addContactButtonItem;
        self.navigationItem.title = @"Address Book";
        
        self.contactDao = [ContactDao instance];
        
        lastIndexChanged = -1;
    }
    
    return self;
}

- (void)setAddedContact:(Contact *)contact {
    lastIndexChanged = [self.contactDao indexByContact:contact];
    
    NSString *message = [NSString stringWithFormat:@"New contact: %@", contact.name];
    
    UIAlertController *addedAlertController = [UIAlertController alertControllerWithTitle:@"Contact added" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"continue" style:UIAlertActionStyleCancel handler:nil];
    
    [addedAlertController addAction:continueAction];
    
    [self presentViewController:addedAlertController animated:YES completion:nil];
}

- (void)setUpdatedContact:(Contact *)contact {
    lastIndexChanged = [self.contactDao indexByContact:contact];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *currentContact = [self.contactDao contactAtIndex:indexPath.row];
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:contactListReuseIdentifier];
    
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactListReuseIdentifier];
    }
    
    tableViewCell.textLabel.text = currentContact.name;
    
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedContact = [self.contactDao contactAtIndex:indexPath.row];
    
    [self goToAddViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactDao.total;
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastIndexChanged inSection:0];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:animated scrollPosition:UITableViewScrollPositionNone];
    
    lastIndexChanged = -1;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end