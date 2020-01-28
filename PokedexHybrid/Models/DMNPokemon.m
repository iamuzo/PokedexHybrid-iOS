//
//  DMNPokemon.m
//  PokedexHybrid
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

#import "DMNPokemon.h"

@implementation DMNPokemon

- (instancetype)initWithName:(NSString *)name
                   identifier:(NSInteger)identifier
                    abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        ///copy ensures that the type of the passed in parameter matches the type of the instance variable (_)
        _name = [name copy];
        _identifer = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

//which one of the init's is being called?
//initWithName or init?
//I think it is the one below that gets called and that inturn calls the initWithName above
//this is the default initializer
- (instancetype)init
{
    /// setting the default values
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

@end

///add extension that allows us to iterate through our topLevel Dictionary
@implementation DMNPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    ///create a `name` variable that is of type NSString and
    ///set it equal to the value of the key called `name` in the dictionary passed into the function `initWithDictionary`
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    /// this is an arrar of dictionaries; I think I ought to rename this to abilitiesArrayOfDictionaries because.
    NSArray * abilitiesArrayOfDictionaries = dictionary[@"abilities"];
    
    /// create a mutable array that contains objects that
    /// are of type NSString, these mutable array has a pointer called `abilities` (meaning var abilites points to it)
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    /// for each dictionary in abilitiesArrayOfDictionaries
    for (NSDictionary *abilityDictionary in abilitiesArrayOfDictionaries) {
        
        ///set nestedDictionary equal to the value of what the `ability` key in abilityDictionary
        NSDictionary *nestedDictionary = abilityDictionary[@"ability"];
        
        /// set `abilityName` equal to the value of `name` key in nestedDictionary
        NSString *abilityName = nestedDictionary[@"name"];
        
        /// add the string that points to `abilityName` to the abilities array
        [abilities addObject:abilityName];
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
