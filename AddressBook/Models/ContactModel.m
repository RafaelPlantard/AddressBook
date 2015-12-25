//
//  ContactDao.m
//  AddressBook
//
//  Created by Rafael Ferreira on 12/18/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    
    return dateFormatter;
}

- (NSString *)description {
    NSString *data = [NSString stringWithFormat:
                      @"Name: %@; "
                      "Address: %@; "
                      "E-mail: %@; "
                      "Phone: %@; "
                      "WebSite: %@.",
                      self.name, self.address, self.eMail, self.phone, self.webSite];
    
    return data;
}

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectId": @"objectId",
             @"createdAt": @"createdAt",
             @"updatedAt": @"updatedAt",
             @"name": @"name",
             @"address": @"address",
             @"eMail": @"emailAddress",
             @"phone": @"phoneNumber",
             @"webSite": @"webSite"
             };
}

#pragma mark - JSON Transformers

+ (NSValueTransformer *) createdAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(id date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *) updatedAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(id date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end