//
//  AppFileManager.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppFileManager : NSObject
/**
 文件夹是否存在
 
 @param folderPath 文件夹路径
 @return 是否存在
 */
+(BOOL)folderExistWithFolderPath:(NSString *)folderPath;

/**
 文件是否存在
 
 @param filePath 文件路径
 @return 是否存在
 */
+(BOOL)fileExistWithFilePath:(NSString *)filePath;


/**
 创建文件夹
 
 @param folderName 文件夹名字
 @param folderPath 路径
 @return 是否创建成功
 */
+(BOOL)createFolderWithFolderPath:(NSString *)folderPath andFolderName:(NSString *)folderName;


/**
 创建文件
 
 @param fileName 文件名
 @param filePath 文件路径
 @return 是否创建成功
 */
+(BOOL)createFileWithFilePath:(NSString *)filePath andFileName:(NSString*)fileName;


/**
 将字符串写入文件
 
 @param dataStr 要写入的字符串
 @param filePath 文件路径
 @return 是否写入成功
 */
+(BOOL)writeDataWith:(NSString *)dataStr ToFilePath:(NSString *)filePath;


/**
 读取文件内容
 
 @param filePath 文件路径
 @return 文件内容
 */
+(NSString *)readDataFromFilePath:(NSString *)filePath;


/**
 获取文件属性
 
 @param filePath 文件路径
 @return 文件属性
 */
+(NSDictionary *)getFileAttributesWithFilePath:(NSString *)filePath;


/**
 删除文件
 
 @param filePath 文件路径
 @return 是否删除成功
 */
+(BOOL)deleteFileWithFilePath:(NSString *)filePath;


/**
 删除文件夹
 
 @param folderPath 文件夹路径
 @return 是否删除成功
 */
+(BOOL)deleteFolderWithFolderPath:(NSString *)folderPath;


/**
 删除文件夹里面的文件
 
 @param folderPath 文件夹路径
 @return 是否删除成功
 */
+(BOOL)deleteFolderContainFileWithPath:(NSString *)folderPath;


/**
 删除文件夹里面的指定类型的文件但不删除文件夹
 
 @param folderPath 文件夹路径
 @param extensionName 文件类型
 @return 是否删除成功
 */
+(BOOL)deleteFolderContainFileWithPath:(NSString *)folderPath andFileType:(NSString *)extensionName;

/**
 获取单个文件的大小
 
 @param filePath 文件路径
 @return 文件大小(B)
 */
+ (long long)fileSizeAtPath:(NSString*)filePath;



/**
 获取文件夹中所有文件的大小
 
 @param folderPath 文件夹路径
 @return 文件夹大小(B)
 */
+ (long long)folderSizeAtPath:(NSString *)folderPath;


/**
 计算大小
 
 @param fileSize 文件大小
 @return 1025 bytes = 1KB, 1024 * 1024 = 1MB ....
 */
+(NSString *)calculateSize:(long long)fileSize;
@end
