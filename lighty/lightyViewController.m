//
//  lightyViewController.m
//  lighty
//
//  Created by Michael S. Jahn on 7/26/11.
//  Copyright 2011 n/a. All rights reserved.
//

#import "lightyViewController.h"
#import <AVFoundation/AVFoundation.h>


@implementation lightyViewController
@synthesize FlashLightButton;
@synthesize AVSession;


- (void)dealloc
{
    [FlashLightButton release];
  
    [FlashLightButton release];
    [super dealloc];
}




//turn flashlight on or off
- (void)toggleFlashlight
{
	AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if (device.torchMode == AVCaptureTorchModeOff) 
    {
        // Create an AV session
        AVCaptureSession *session = [[AVCaptureSession alloc] init];
        
        // Create device input and add to current session
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
        [session addInput:input];
        
        // Create video output and add to current session      
        AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
        [session addOutput:output];
        
        // Start session configuration
        [session beginConfiguration];
        [device lockForConfiguration:nil];
        
		// Set torch to on
        [device setTorchMode:AVCaptureTorchModeOn];
        
        [device unlockForConfiguration];
        [session commitConfiguration];
        
        // Start the session
        [session startRunning];
        
		// Keep the session around
        [self setAVSession:session];
        
        [output release];
    }
    else 
    {
        [AVSession stopRunning];
        [AVSession release], AVSession = nil;
    }
}    

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
/*- (void)viewDidLoad
{
    [self toggleFlashlight];
}
*/

- (void)viewDidUnload
{
    [self setFlashLightButton:nil];
 
    [FlashLightButton release];
    FlashLightButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)FlashLightButtonPressed:(id)sender {
  
    
       
       if (flashlightOn == NO)
       {
           flashlightOn = YES;
           [FlashLightButton setBackgroundImage:[UIImage imageNamed:@"TurnLightOff.png"] forState:UIControlStateNormal];

           
       }
       else 
       {    	
           flashlightOn = NO;
            [FlashLightButton setBackgroundImage:[UIImage imageNamed:@"TurnLightOn.png"] forState:UIControlStateNormal];
 
       }
       
    [self toggleFlashlight];

        
}
@end
