//
//  DeleteAndEditCartModel.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "DeleteAndEditCartModel.h"

@implementation EditCartResponse

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;{
    self = [super init];
    if(self){
        _status = dictionary[@"status"];
        _data = dictionary[@"data"];
        _totalCart = dictionary[@"total_carts"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}

@end

@implementation DeleteCartResponse

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;{
    self = [super init];
    if(self){
        _status = dictionary[@"status"];
        _data = dictionary[@"data"];
        _totalCart = dictionary[@"total_carts"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}

@end
