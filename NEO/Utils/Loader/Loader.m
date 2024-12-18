//
//  Loader.m
//  NEO
//
//  Created by Neo on 17/12/24.
//


#import "Loader.h"

@implementation Loader

static UIActivityIndicatorView *activityIndicator = nil;

+ (void)setUpLoaderInView:(UIView *)view {
    if (!activityIndicator) {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        activityIndicator.center = view.center;
        activityIndicator.hidesWhenStopped = YES;
        [view addSubview:activityIndicator];
    }
}

+ (void)showLoaderInView:(UIView *)view {
    // Show the loader
    if (activityIndicator) {
        [activityIndicator startAnimating];
        view.userInteractionEnabled = NO;
    }
}

+ (void)hideLoaderInView:(UIView *)view {
    // Hide the loader
    if (activityIndicator) {
        [activityIndicator stopAnimating];
        view.userInteractionEnabled = YES;
    }
}


@end
