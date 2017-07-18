#import "ViewController.h"
#import <TradeItIosTicketSDK2Carthage/TradeItIosTicketSDK2Carthage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [TradeItSDK configureWithApiKey:@"tradeit-test-api-key" oAuthCallbackUrl:[NSURL URLWithString:@"demo"] environment:TradeItEmsTestEnv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchTapped:(id)sender {
    [TradeItSDK.launcher launchBrokerLinkingFromViewController:self];
}

@end
