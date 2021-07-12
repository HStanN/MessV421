### 说明
 此项目基于[Mess](https://github.com/eleme/Mess)，为适配4.2.1版本android gradle tools做了一些代码改动，改造思路参考了[linxuebin1990](https://github.com/linxuebin1990/Mess)

### 改造
 编译相关的task的名字发生有一些变化，部分临时生成的build文件目录也有变化，但是总体处理思路不变，具体参考[文章](https://blog.csdn.net/wolinxuebin/article/details/86631368)

 4.x起编译打包时生成的```aapt_file```将只包含需要```keep```的```class``````-keep class xxx.xx.xx { <init>(); }```,而之前版本不仅包含需要```keep```的```class```还包含```# Referenced at xxx```引用该```class```的资源路径，原来的代码是根据每个```class```的引用路径，再去找对应```xml```修改，但是新版本不包含引用路径后就不能这么做了。这里我选择了最简单粗暴的做法，就是找到```layout```的路径后直接遍历目录并比对是否包含所```keep```的```class```

 相对来说AndroidManifest文件修改就比较简单，只是最后的build目录名字变了，现在在```
 "${project.buildDir.absolutePath}/intermediates/packaged_manifests/${adjustAssembleName}/AndroidManifest.xml"```下

 *PS*：由于没有找到原来获取```aapt2```路径的替换方法，所以简单粗暴的直接配置到```local.properties```中读取

### 最后
 由于赶进度，所以这个插件的修改非常仓促，完全没有代码的优化（本着能用就行的原则）,欢迎各位可以提交PR