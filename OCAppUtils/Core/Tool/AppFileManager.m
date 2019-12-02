//
//  AppFileManager.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "AppFileManager.h"

@interface AppFileManager()

@end

@implementation AppFileManager
+(NSFileManager *)fileManager{
    return [NSFileManager defaultManager];
}

+ (BOOL)folderExistWithFolderPath:(NSString *)folderPath{
    BOOL isDir = NO;
    BOOL existed = [self.fileManager fileExistsAtPath:folderPath isDirectory:&isDir];
    if ( isDir == YES && existed == YES){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)fileExistWithFilePath:(NSString *)filePath{
    BOOL isDir = NO;
    BOOL existed = [self.fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    if ( isDir == NO && existed == YES){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)createFolderWithFolderPath:(NSString *)folderPath andFolderName:(NSString *)folderName{
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",folderPath,folderName];
    if ([self folderExistWithFolderPath:fullPath]) {
        return YES;
    }
    return [self.fileManager createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (BOOL)createFileWithFilePath:(NSString *)filePath andFileName:(NSString *)fileName{
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",filePath,fileName];
    if ([self fileExistWithFilePath:fullPath]) {
        return YES;
    }
    return [self.fileManager createFileAtPath:fullPath contents:nil attributes:nil];
}

+ (BOOL)writeDataWith:(NSString *)dataStr ToFilePath:(NSString *)filePath{
    if ([self fileExistWithFilePath:filePath]) {
        return [dataStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        return NO;
    }
}

+ (NSString *)readDataFromFilePath:(NSString *)filePath{
    if ([self fileExistWithFilePath:filePath]) {
        return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }else{
        return nil;
    }
}

+ (NSDictionary *)getFileAttributesWithFilePath:(NSString *)filePath{
    if ([self fileExistWithFilePath:filePath]) {
        return  [self.fileManager attributesOfItemAtPath:filePath error:nil];
    }else{
        return nil;
    }
}

+(BOOL)deleteFileWithFilePath:(NSString *)filePath{
    if ([self fileExistWithFilePath:filePath]) {
        return [self.fileManager removeItemAtPath:filePath error:nil];
    }else{
        return NO;
    }
}

+ (BOOL)deleteFolderWithFolderPath:(NSString *)folderPath{
    if ([self folderExistWithFolderPath:folderPath]) {
        return [self.fileManager removeItemAtPath:folderPath error:nil];
    }else{
        return NO;
    }
}

+ (BOOL)deleteFolderContainFileWithPath:(NSString *)folderPath{
    if ([self folderExistWithFolderPath:folderPath]) {
        NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:folderPath error:NULL];
        NSEnumerator *e = [contents objectEnumerator];
        NSString *filename;
        while ((filename = [e nextObject])) {
            [self.fileManager removeItemAtPath:[folderPath stringByAppendingPathComponent:filename] error:NULL];
        }
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)deleteFolderContainFileWithPath:(NSString *)folderPath andFileType:(NSString *)extensionName{
    if ([self folderExistWithFolderPath:folderPath]) {
        NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:folderPath error:NULL];
        NSEnumerator *e = [contents objectEnumerator];
        NSString *filename;
        while ((filename = [e nextObject])) {
            if ([[filename pathExtension] isEqualToString:extensionName]) {
                [self.fileManager removeItemAtPath:[folderPath stringByAppendingPathComponent:filename] error:NULL];
            }
        }
        return YES;
    }else{
        return NO;
    }
}

+ (long long)fileSizeAtPath:(NSString*)filePath{
    if ([self fileExistWithFilePath:filePath]){
        return [[self.fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

+ (long long)folderSizeAtPath:(NSString *)folderPath{
    if (![self folderExistWithFolderPath:folderPath]) return 0;
    NSArray *childFiles = [self.fileManager subpathsAtPath:folderPath];
    long long folderSize = 0;
    for (NSString *fileName in childFiles) {
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += (long long)[[self fileManager]attributesOfItemAtPath:fileAbsolutePath error:nil][NSFileSize];
    }
    return folderSize;
}

+ (NSString *)calculateSize:(long long)fileSize{
    return [NSByteCountFormatter stringFromByteCount:fileSize countStyle:NSByteCountFormatterCountStyleBinary];
}


@end
