//
//  ApplicationCommandsManager.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationCommandsManager : NSObject
+ (ApplicationCommandsManager*)sharedInstance;
- (void)openTabHome:(NSDictionary*)args ;
- (void)openBlog:(NSDictionary*)args ;
- (void)openTabActions:(NSDictionary*)args ;
- (void)openTabMyOrder:(NSDictionary*)args ;
- (void)openTabHelp:(NSDictionary*)args ;
- (void)openTabSettings:(NSDictionary*)args ;
- (void)shareBlog:(NSDictionary*)args ;
- (void)openTravel:(NSDictionary*)args ;
- (void)openCheckList:(NSDictionary*)args ;
- (void)openVideoTutorial:(NSDictionary*)args;
- (void)openPumpAndAlarms:(NSDictionary*)args;
- (void)openTips:(NSDictionary*)args;
- (void)openPumpSettings:(NSDictionary*)args;
- (void)openAlertsSettings:(NSDictionary*)args;
@end
