//
//  OEXRegistrationFieldCheckBoxController.m
//  edXVideoLocker
//
//  Created by Jotiram Bhagat on 17/02/15.
//  Copyright (c) 2015 edX. All rights reserved.
//

#import "OEXRegistrationFieldCheckBoxController.h"
#import "OEXRegistrationFieldCheckBoxView.h"
@interface OEXRegistrationFieldCheckBoxController ()
@property(nonatomic, strong) OEXRegistrationFormField* field;
@property(nonatomic, strong) OEXRegistrationFieldCheckBoxView* view;
@end

@implementation OEXRegistrationFieldCheckBoxController
- (instancetype)initWithRegistrationFormField:(OEXRegistrationFormField*)field {
    self = [super init];
    if(self) {
        self.field = field;
        self.view = [[OEXRegistrationFieldCheckBoxView alloc] init];
        self.view.instructionMessage = field.instructions;
        self.view.label = field.label;
    }
    return self;
}

- (NSNumber*)currentValue {
    return @([self.view currentValue]);
}

- (BOOL)hasValue {
    return [self.view currentValue];
}

- (void)handleError:(NSString*)errorMsg {
    [self.view setErrorMessage:errorMsg];
}

- (BOOL)isValidInput {
    if(self.field.isRequired && ![[self currentValue] boolValue]) {
        [self handleError:self.field.errorMessage.required];
        return NO;
    }
    return YES;
}

@end
