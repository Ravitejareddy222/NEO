//
//  ProductListServices.h
//  NEO
//
//  Created by Neo on 10/12/24.
//

#import <Foundation/Foundation.h>
#import "ProductListModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProductListServicesProtocol <NSObject>

-(void) getproductListData: (NSDictionary *)params
                completion: (void(^)(ProductListResponse * _Nullable response, NSError * _Nullable error))completion;

@end

@interface ProductListServices : NSObject<ProductListServicesProtocol>

@end

NS_ASSUME_NONNULL_END
