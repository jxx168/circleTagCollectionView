//
//  AGFileUtil.h
//  Agent
//
//  Created by 闫强 on 2020/4/13.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AGFileUtil : NSObject
//返回缓存根目录 "caches"
+(NSString *)getCachesDirectory;

//返回根目录路径 "document"
+ (NSString *)getDocumentPath;

//创建文件夹
+(BOOL)creatDir:(NSString*)dirPath;

//删除文件夹
+(BOOL)deleteDir:(NSString*)dirPath;

//移动文件夹
+(BOOL)moveDir:(NSString*)srcPath to:(NSString*)desPath;

//创建文件
+ (BOOL)creatFile:(NSString*)filePath withData:(NSData*)data;

//读取文件
+(NSData*)readFile:(NSString *)filePath;

//删除文件
+(BOOL)deleteFile:(NSString *)filePath;

//返回 文件全路径
+ (NSString*)getFilePath:(NSString*) fileName;

//在对应文件保存数据
+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data;

//从对应的文件读取数据
+ (NSData*)readDataFromFile:(NSString*)fileName;

//往指定全路径存储文件
+ (BOOL)writeFileAllPath:(NSString*)filePath data:(NSData*)data;

//判断是否包含文件 指定路径
+(BOOL)isContainFile:(NSString *)filePath;

//获取指定路径文件大小
+ (NSString *)unitConversion:(NSString *)filePath;
@end

NS_ASSUME_NONNULL_END
