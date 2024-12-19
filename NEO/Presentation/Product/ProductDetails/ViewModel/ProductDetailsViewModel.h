//
//  ProductDetailsViewModel.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>
#import "ProductDetailServices.h"

@class ProductDetailsResponseHandler;

typedef void (^GetProductDetailsSuccessBlock)(void);
typedef void (^GetProductDetailsFailureBlock)(NSString  * _Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsViewModel : NSObject

@property (nonatomic, strong) GetProductDetailsSuccessBlock getProductDetailsSuccessfull;
@property (nonatomic, strong) GetProductDetailsFailureBlock getProductDetailsFailure;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, strong) id<ProductDetailServicesProtocol> productDetailsProtocol;
@property (nonatomic, strong) ProductDetails *productDetails;

-(void) getProductDetails: (long)productId;
-(NSString *) getProductCategory: (NSNumber *)productCategoryId;
@end

NS_ASSUME_NONNULL_END
