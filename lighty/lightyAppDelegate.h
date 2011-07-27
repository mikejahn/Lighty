//
//  lightyAppDelegate.h
//  lighty
//
//  Created by Michael S. Jahn on 7/26/11.
//  Copyright 2011 n/a. All rights reserved.
//

#import <UIKit/UIKit.h>

@class lightyViewController;

@interface lightyAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet lightyViewController *viewController;

@end
