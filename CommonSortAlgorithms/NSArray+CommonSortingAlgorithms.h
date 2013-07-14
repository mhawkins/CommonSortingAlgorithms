//
//  NSArray+CommonSortingAlgorithms.h
//  CommonSortAlgorithms
//
//  Created by Matt Hawkins on 7/14/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CommonSortingAlgorithms)
-(NSArray *)bubbleSortUsingNSComparisonResult:(NSComparisonResult)comparisonResult;
-(NSArray *)bubbleSort;
-(NSArray *)quickSort;
@end
