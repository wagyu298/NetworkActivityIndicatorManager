// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <UIKit/UIKit.h>
#import <LiveObjectTracer/LiveObjectTracer.h>
#import "SNASharedNetworkActivityIndicator.h"

@interface SNASharedNetworkActivityIndicator () <LOTLiveObjectCounterDelegate>

@property (nonatomic, nonnull, strong) LOTLiveObjectCounter *counter;

- (void)networkActivityIndicator:(BOOL)on;

@end

@implementation SNASharedNetworkActivityIndicator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _counter = [[LOTLiveObjectCounter alloc] initWithDelegate:self];
    }
    return self;
}

- (void)lot_counter:(LOTLiveObjectCounter *)counter didChangeCount:(NSUInteger)count previousCount:(NSUInteger)previousCount
{
    if (count == 0 && previousCount > 0) {
        [self networkActivityIndicator:NO];
    } else if (count > 0 && previousCount == 0) {
        [self networkActivityIndicator:YES];
    }
}

- (void)networkActivityIndicator:(BOOL)on
{
    if ([NSThread isMainThread]) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = on;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = on;
        });
    }
}

- (void)enableNetworkActivityIndicatorWithObject:(id <NSObject>)object
{
    [self.counter addObject:object];
}

- (void)disableNetworkActivityIndicatorWithObject:(id <NSObject>)object
{
    [self.counter removeObject:object];
}

+ (instancetype)sharedIndicator
{
    static SNASharedNetworkActivityIndicator *indicator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        indicator = [[SNASharedNetworkActivityIndicator alloc] init];
    });
    return indicator;
}

@end
