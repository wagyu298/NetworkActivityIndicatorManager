// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

// https://github.com/Specta/Specta

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <SharedNetworkActivityIndicator/SharedNetworkActivityIndicator.h>

SpecBegin(SharedNetworkActivityIndicatorSpecs)

describe(@"NSObject+SharedNetworkActivityIndicator", ^{
    
    it(@"Start with an object", ^{
        NSObject *object = [[NSObject alloc] init];
        
        object.sna_networkActivityIndicatorVisible = YES;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beTruthy();
        
        object.sna_networkActivityIndicatorVisible = NO;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beFalsy();
    });
    
    it(@"Start with two objects", ^{
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        object1.sna_networkActivityIndicatorVisible = YES;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beTruthy();
        
        object2.sna_networkActivityIndicatorVisible = YES;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beTruthy();

        object1.sna_networkActivityIndicatorVisible = NO;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beTruthy();
        
        object2.sna_networkActivityIndicatorVisible = NO;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beFalsy();
    });
    
    it(@"Start with NO", ^{
        NSObject *object = [[NSObject alloc] init];
        
        object.sna_networkActivityIndicatorVisible = NO;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beFalsy();
        
        object.sna_networkActivityIndicatorVisible = YES;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beTruthy();
        
        object.sna_networkActivityIndicatorVisible = NO;
        expect([UIApplication sharedApplication].networkActivityIndicatorVisible).to.beFalsy();
    });
    
});

SpecEnd
