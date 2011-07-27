//
//  lightyViewController.h
//  lighty
//
//  Created by Michael S. Jahn on 7/26/11.
//  Copyright 2011 n/a. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface lightyViewController : UIViewController {
    
    
    UIButton *FlashLightButton;
    
    AVCaptureSession *AVSession;
    BOOL							flashlightOn;

}
@property (nonatomic, retain) IBOutlet UIButton *FlashLightButton;
- (IBAction)FlashLightButtonPressed:(id)sender;
@property (nonatomic, retain) AVCaptureSession *AVSession;


@end
