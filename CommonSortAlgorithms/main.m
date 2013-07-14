//
//  main.m
//  CommonSortAlgorithms
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+CommonSortingAlgorithms.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *numbersArray = @[ @(5), @(1), @(4), @(3), @(2) ];
        NSArray *sortedNumbersArray = [numbersArray bubbleSort];
        NSLog(@"Sorted numbers array.... '%@'", sortedNumbersArray);
        
        NSArray *stringArray = @[ @"Bravo", @"Alpha", @"Gamma", @"Delta", @"Charlie"];
        NSArray *sortedStringArray = [stringArray bubbleSort];
        NSLog(@"Sorted strings array.... '%@'", sortedStringArray);
        
    }
    return 0;
}

