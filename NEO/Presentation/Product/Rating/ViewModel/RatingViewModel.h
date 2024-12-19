//
//  RatingViewModel.h
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import <Foundation/Foundation.h>
#import "RatingsServices.h"
@class RatingResponseHandler;

typedef void (^RatingSuccessBlock)(void);
typedef void (^RatingFailureBlock)(NSString *_Nullable errorMessage);
typedef void (^StartLoadingBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface RatingViewModel : NSObject
@property (nonatomic, strong) RatingSuccessBlock ratingsSaveSuccessful;
@property (nonatomic, strong) RatingFailureBlock ratingsSaveFailure;
@property (nonatomic, strong) StartLoadingBlock onStartLoading;
@property (nonatomic, strong) NSMutableDictionary *params;
-(void) rateProduct: (NSNumber *)rating productId: (NSNumber *)productId;
@property (nonatomic, strong) id<RatingsServicesProtocol> ratingsProtocol;

@end

NS_ASSUME_NONNULL_END

