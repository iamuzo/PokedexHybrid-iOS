//
//  DMNPokemon.h
//  PokedexHybrid
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import <Foundation/Foundation.h>

///this protects us against options which comes in handy
///when we switch to swift in the ViewControllers
NS_ASSUME_NONNULL_BEGIN

@interface DMNPokemon : NSObject

@property (nonatomic, readonly) NSInteger identifer;
@property (nonatomic, copy, readonly) NSString *name;
// NSArray<NSString *> == An array of strings
// NSArray<NSString *> *abilities == An array of strings called abilities
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;


/// NS_DESIGNATED_INITIALIZER helps the complier out by finding this initializer faster
- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;
@end

/// this is an extension
@interface DMNPokemon (JSONConvertable)

    ///id is a pointer to any Objective-C object (same as Any in Swift)
- (instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
