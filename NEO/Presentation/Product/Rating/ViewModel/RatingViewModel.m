//
//  RatingViewModel.m
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import "RatingViewModel.h"

@implementation RatingViewModel

-(void) rateProduct: (NSNumber *)rating productId: (NSNumber *)productId{
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:rating forKey:@"rating"];
    [self.params setObject:productId forKey:@"product_id"];

    
    [_ratingsProtocol saveRatings:_params completion:^(RatingsResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.ratingsSaveFailure(@"Error");
        }
        
        if(response.status.intValue == 200){
            self.ratingsSaveSuccessful();
        }else{
            self.ratingsSaveFailure(@"Error");
        }
    }];
}
@end
