//
//  WesternMusicalNote.m
//  WesternMusicElements
//
//  Created by Cormier Frederic on 05/03/12.
//  Copyright (c) 2012 International MicrOondes. All rights reserved.
//

#import "WesternMusicalNote.h"

@implementation WesternMusicalNote


@synthesize root = root_;
@synthesize accidental = accidental_;
@synthesize octave = octave_;
@synthesize shortName = shortName_;
@synthesize midiValue = midiValue_;
@synthesize cpspch = cpspch_;
@synthesize frequency = frequency_;



- (id)initWithRoot:(NSString *)aRoot 
        accidental:(NSString *)anAccidental 
          atOctave:(int)anOctave
     withMidiValue:(int)mValue
         andCpspch:(float)cpspchValue
       atFrequency:(float)freq
      forShortName:(NSString *)aShortName{
    
    if (self = [super init]) {
        root_ = [aRoot uppercaseString];
        accidental_ = anAccidental;
        octave_ = anOctave;
        midiValue_ = mValue;
        cpspch_ = cpspchValue;
        frequency_ = freq;
        shortName_ = aShortName;
    }
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %d, %d, %f, %f, for %@",
            [self root], 
            [self accidental], 
            [self octave],
            [self midiValue],
            [self cpspch],
            [self frequency],
            [self shortName]];
            
    
}
@end
