//: Playground - noun: a place where people can play

import UIKit

//let homeDir = NSHomeDirectory()
//var fileManager = NSFileManager.defaultManager()
//
//let dirOne = homeDir+"/Documents/myFolder/Images"
//let dirTWo = homeDir+"/Document/myFolder/Music"
//if !fileManager.fileExistsAtPath(dirOne){
//    try! fileManager.createDirectoryAtPath(dirOne, withIntermediateDirectories: true, attributes: nil)
//}
//
//if !fileManager.fileExistsAtPath(dirTWo)
//{
//
//
//    try! fileManager.createDirectoryAtPath(dirTWo, withIntermediateDirectories: true, attributes: nil)
//}
//
//
//
//let contentURl = try? fileManager.contentsOfDirectoryAtPath(homeDir)
//print(contentURl)
//假设用户文档下有如下文件和文件夹[test1.txt,fold1/test2.txt]
let manager = NSFileManager.defaultManager()
let urlForDocument = manager.URLsForDirectory( NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
print(urlForDocument)
let url = urlForDocument[0] as NSURL
print(url)

////（1）对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfPath = try? manager.contentsOfDirectoryAtPath(url.path!)
//contentsOfPath：Optional([fold1, test1.txt])
print("contentsOfPath: \(contentsOfPath)")
//
////（2）类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfURL = try? manager.contentsOfDirectoryAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles);
print(contentsOfURL)
//比较contentsOfDirectoryAtURL 与 contentsOfDirectoryAtPath异同
////（3）深度遍历，会递归遍历子文件夹（但不会递归符号链接）
//let enumeratorAtPath = manager.enumeratorAtPath(url.path!)
////enumeratorAtPath：Optional([fold1, fold1/test2.txt, test1.txt])
//print("enumeratorAtPath: \(enumeratorAtPath?.allObjects)")
//
////（4）类似上面的，深度遍历，会递归遍历子文件夹（但不会递归符号链接）
//let enumeratorAtURL = manager.enumeratorAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, errorHandler:nil)
////contentsOfURL：Optional([file://Users/.../Application/.../Documents/fold1/,
//// file://Users/.../Application/.../Documents/fold1/test2.txt,
//// file://Users/.../Application/.../Documents/test1.txt])
//print("enumeratorAtURL: \(enumeratorAtURL?.allObjects)")
//
////（5）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
//let subPaths = manager.subpathsAtPath(url.path!)
////subPaths：Optional([fold1, fold1/test2.txt, test1.txt])
//print("subPaths: \(subPaths)")
let fileManager = NSFileManager.defaultManager()
let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
var exist = fileManager.fileExistsAtPath(filePath)
let myDirectory:String = NSHomeDirectory() + "/Documents/myFolder/Files"


//withIntermediateDirectories为ture表示路径中间如果有不存在的文件夹都会创建
try! fileManager.createDirectoryAtPath(filePath,
    withIntermediateDirectories: true, attributes: nil)



func createFolder(name:String, baseUrl:NSURL){
    let manager = NSFileManager.defaultManager()
    let folder = baseUrl.URLByAppendingPathComponent(name, isDirectory: true)
    print("文件夹: \(folder)")
    let exist = manager.fileExistsAtPath(folder.path!)
    if !exist {
        try! manager.createDirectoryAtURL(folder, withIntermediateDirectories: true, attributes: nil)
    }
}

let basefolder = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask )
let baseUrl = basefolder[0] as NSURL

createFolder("music", baseUrl: baseUrl)



