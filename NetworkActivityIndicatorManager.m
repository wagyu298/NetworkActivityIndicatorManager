// This is free and unencumbered software released into the public domain.
// For more information, please refer to <http://unlicense.org/>

#import <UIKit/UIKit.h>
#import "NetworkActivityIndicatorManager.h"

@implementation NetworkActivityIndicatorManager

+ (NetworkActivityIndicatorManager *)sharedManager
{
    static NetworkActivityIndicatorManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetworkActivityIndicatorManager alloc] init];
    });
    return manager;
}

- (void)networkActivityIndicator:(BOOL)on
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = on;
}

@end
