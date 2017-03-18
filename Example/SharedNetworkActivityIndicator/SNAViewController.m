// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import "SNAViewController.h"
#import <SharedNetworkActivityIndicator/SharedNetworkActivityIndicator.h>

@interface SNAViewController ()

@property (nonatomic, weak) IBOutlet UISwitch *switch1;
@property (nonatomic, weak) IBOutlet UISwitch *switch2;

@property (nonatomic, nullable, strong) NSObject *object1;

@end

@implementation SNAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switch1WhenValueChanged:(id)sender
{
    // Control by object lifecycle
    if (self.switch1.on) {
        self.object1 = [[NSObject alloc] init];
        self.object1.sna_networkActivityIndicatorVisible = YES;
    } else {
        self.object1 = nil;
    }
}
- (IBAction)switch2WhenValueChanged:(id)sender
{
    // Control by on/off
    self.switch2.sna_networkActivityIndicatorVisible = self.switch2.on;
}

@end
