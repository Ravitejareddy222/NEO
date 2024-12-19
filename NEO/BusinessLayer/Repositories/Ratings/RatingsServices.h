//
//  RatingsServices.h
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import <Foundation/Foundation.h>
#import "RatingsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RatingsServicesProtocol <NSObject>

-(void) saveRatings: (NSDictionary *)params completion: (void (^)(RatingsResponse * _Nullable response, NSError *_Nullable error))completion;

@end
@interface RatingsServices : NSObject<RatingsServicesProtocol>

@end

NS_ASSUME_NONNULL_END
