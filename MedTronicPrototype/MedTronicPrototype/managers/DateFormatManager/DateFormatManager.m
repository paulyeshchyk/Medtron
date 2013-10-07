//
//  DateFormatManager.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "DateFormatManager.h"
@interface DateFormatManager(){
}
@property (nonatomic, strong)NSMutableDictionary* formatters;


@end

@implementation DateFormatManager
@synthesize formatters;
static DateFormatManager *sharedInstance_ = nil;

+ (DateFormatManager*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

+ (NSDateFormatter*)formatterWithPattern:(NSString*)pattern {
    NSMutableDictionary* formatters = [self sharedInstance].formatters;
    id formatter = [formatters objectForKey:pattern];
    if (formatter == nil) {
        formatter = [NSDateFormatter new];
        [formatter setDateFormat:pattern];
        [formatters setObject:formatter forKey:pattern];
    }
    return formatter;
}


- (id)init {
    self = [super init];
    if (self){
        self.formatters = [NSMutableDictionary new];
    }
    return self;
}

@end
