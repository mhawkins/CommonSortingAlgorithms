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
        NSArray *sortedNumbersArrayBubble = [numbersArray bubbleSort];
        NSLog(@"Sorted numbers array using bubble sort.... '%@'", sortedNumbersArrayBubble);
        NSArray *sortedNumbersArrayQuick = [numbersArray quickSort];
        NSLog(@"Sorted numbers array using quick sort.... '%@'", sortedNumbersArrayQuick);
        
        NSArray *stringArray = @[ @"Bravo", @"Alpha", @"Gamma", @"Delta", @"Charlie"];
        NSArray *sortedStringArrayBubble = [stringArray bubbleSort];
        NSLog(@"Sorted strings array using bubble sort.... '%@'", sortedStringArrayBubble);
        NSArray *sortedStringArrayQuick = [stringArray quickSort];
        NSLog(@"Sorted strings array using quick sort.... '%@'", sortedStringArrayQuick);
        
    }
    return 0;
}

