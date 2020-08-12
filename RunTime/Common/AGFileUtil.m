//
//  AGFileUtil.m
//  Agent
//
//  Created by 闫强 on 2020/4/13.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGFileUtil.h"

@implementation AGFileUtil
// 返回缓存根目录 "caches"
+(NSString *)getCachesDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *caches = [paths firstObject];
    return caches;
}

// 返回根目录路径 "document"
+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths firstObject];
    return documentPath;
}

// 创建文件目录
+(BOOL)creatDir:(NSString*)dirPath
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath])//判断dirPath路径文件夹是否已存在，此处dirPath为需要新建的文件夹的绝对路径
    {
        return NO;
    }
    else
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];//创建文件夹
        return YES;
    }

}

//判断是否包含文件 指定路径
+(BOOL)isContainFile:(NSString *)filePath{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return YES;
    }
    return NO;
}

// 删除文件目录
+(BOOL)deleteDir:(NSString*)dirPath
{
    if([[NSFileManager defaultManager] fileExistsAtPath:dirPath])//如果存在临时文件的配置文件

    {
        NSError *error=nil;
         return [[NSFileManager defaultManager]  removeItemAtPath:dirPath error:&error];

    }

    return  NO;
}

// 移动文件夹
+(BOOL)moveDir:(NSString*)srcPath to:(NSString*)desPath;
{
    NSError *error=nil;
    if([[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:desPath error:&error]!=YES)// prePath 为原路径、     cenPath 为目标路径
    {
        NSLog(@"移动文件失败");
        return NO;
    }
    else
    {
        NSLog(@"移动文件成功");
        return YES;
    }
}

// 创建文件
+ (BOOL)creatFile:(NSString*)filePath withData:(NSData*)data
{
   return  [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

//读取文件
+(NSData*)readFile:(NSString *)filePath
{
    return [NSData dataWithContentsOfFile:filePath options:0 error:NULL];
}

// 删除文件
+(BOOL)deleteFile:(NSString *)filePath
{

    return [self deleteDir:filePath];

}

+ (NSString *)getFilePath:(NSString *)fileName
{
    NSString *dirPath = [[self getDocumentPath] stringByAppendingPathComponent:fileName];
    return dirPath;
}


+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data
{
    NSString *filePath=[self getFilePath:fileName];
    return [self creatFile:filePath withData:data];
}

+ (BOOL)writeFileAllPath:(NSString*)filePath data:(NSData*)data
{
    return [self creatFile:filePath withData:data];
}

+ (NSData*)readDataFromFile:(NSString*)fileName
{
    NSString *filePath=[self getFilePath:fileName];
    return [self readFile:filePath];
}

+ (NSString *)unitConversion:(NSString *)filePath{
//    if (pb_string_is_blank(filePath)) {
//        return @"0.0M";
//    }
    double cacheSize = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil].fileSize;
    if (cacheSize > 0 && cacheSize < 1024) {
        return [NSString stringWithFormat:@"%ldB", (long)cacheSize];
    }else if (cacheSize >= 1024 && cacheSize < 1024 * 1024){
        return [NSString stringWithFormat:@"%.2fKB", (long)cacheSize / 1024.0];
    }else if (cacheSize >= 1024 * 1024 && cacheSize < 1024 * 1024 * 1024){
        return [NSString stringWithFormat:@"%.2fMB", (long)cacheSize / (1024 * 1024.0)];
    }else if(cacheSize >= 1024 * 1024 * 1024 ){
        return [NSString stringWithFormat:@"%.2fG", (long)cacheSize /(1024 * 1024 * 1024.0)];
    }
    return @"0.0M";
}
@end
