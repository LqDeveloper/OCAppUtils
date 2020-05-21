//
//  NSArray+LQSort.m
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/21.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

#import "NSArray+LQSort.h"

@implementation NSArray (LQSort)
- (NSArray *)sortWithType:(LQSortType)type AndBlock:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    switch (type) {
        case SelectSort:
            return [self selectSort:block];
        case InsertSort:
            return [self insertSort:block];
        case BubbleSort:
            return [self bubbleSort:block];
        case ShellSort:
            return [self shellSort:block];
        case MergeSort:
            return [self mergeSort:block];
    }
    return self;
}



- (NSArray *)sort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    return [self sortWithType:BubbleSort AndBlock:block];
}

-(NSArray *)selectSort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    NSInteger n = arr.count;
    for (NSInteger i = 0; i < n - 1; i++) {
        for (NSInteger j = i + 1;j < n; j++) {
            if (block(arr[i],arr[j])) {
                id temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return [arr copy];
}


-(NSArray *)insertSort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    NSInteger n = arr.count;
    for (NSInteger i = 1; i < n; i++) {
        id temp = arr[i];
        NSInteger k = i - 1;
        while (k >= 0 && block(arr[k],temp)) {
            k--;
        }
        for (NSInteger j = i; j > k+1; j--) {
            arr[j] = arr[j-1];
        }
        arr[k+1] = temp;
    }
    return [arr copy];
}

-(NSArray *)bubbleSort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    NSInteger n = arr.count;
    for (NSInteger i = 0; i < n - 1; i++) {
        for (NSInteger j = 0; j < n - i - 1; j++) {
            if (block(arr[j],arr[j+1])) {
                id temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    return [arr copy];
}

-(NSArray *)shellSort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    NSInteger n = arr.count;
    for (NSInteger h = n / 2; h > 0; h = h/2) {
        for (NSInteger i = h; i < n; i++) {
            id temp = arr[i];
            NSInteger k = i - h;
            while (k >= 0 && block(arr[k],temp)) {
                arr[k+h] = arr[k];
                k = k - h;
            }
            arr[k+h] = temp;
        }
    }
    return [arr copy];
}

-(NSArray *)mergeSort:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (self.count <= 1 || block == nil) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    NSInteger n = arr.count;
    for (NSInteger i = 1; i < n; i++) {
        NSInteger left = 0;
        NSInteger mid = left + i - 1;
        NSInteger right = mid + i;
        while (right < n) {
            [self merge:arr left:left mid:mid right:right block:block];
            left = right + 1;
            mid = left + i - 1;
            right = mid + i;
        }
        if (left < n && mid < n) {
            [self merge:arr left:left mid:mid right:n - 1 block:block];
        }
    }
    return [arr copy];
}


-(void)merge:(NSMutableArray *)arr left:(NSInteger)left mid:(NSInteger)mid right:(NSInteger)right block:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSMutableArray *temp = [NSMutableArray arrayWithArray:arr];
    NSInteger k = 0,i = left,j = mid + 1;
    while (i <= mid && j <= right) {
        if (block(arr[j],arr[i])) {
            temp[k] = arr[i];
            k = k + 1;
            i = i + 1;
        }else{
            temp[k] = arr[j];
            k = k + 1;
            j = j + 1;
        }
    }
    while (i <= mid) {
        temp[k] = arr[i];
        k = k + 1;
        i = i + 1;
    }
    
    while (j <= right) {
        temp[k] = arr[j];
        k = k + 1;
        j = j + 1;
    }
    
    k = 0;
    i = left;
    while (i <= right) {
        arr[i] = temp [k];
        k = k + 1;
        i = i + 1;
    }
}

@end
