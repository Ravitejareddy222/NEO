//
//  ProductDetailServices.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>
#import "ProductDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProductDetailServicesProtocol <NSObject>

-(void) getProductDetailsData: (NSDictionary *)params completion: (void (^)(ProductDetailsResponse * _Nullable response, NSError *_Nullable error))completion;

@end

@interface ProductDetailServices : NSObject<ProductDetailServicesProtocol>



@end

NS_ASSUME_NONNULL_END
