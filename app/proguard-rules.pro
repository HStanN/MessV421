## Add project specific ProGuard rules here.
## By default, the flags in this file are appended to flags specified
## in /Applications/Android Studio.app/sdk/tools/proguard/proguard-android.txt
## You can edit the include path and order by changing the proguardFiles
## directive in build.gradle.
##
## For more details, see
##   http://developer.android.com/guide/developing/tools/proguard.html
#
## Add any project specific keep options here:
#
## If your project uses WebView with JS, uncomment the following
## and specify the fully qualified class name to the JavaScript interface
## class:
##-keepclassmembers class fqcn.of.javascript.interface.for.webview {
##   public *;
##}
#
#-dontshrink
#-optimizationpasses 5
#-dontusemixedcaseclassnames#混淆时不会大小写混合类名
#-dontskipnonpubliclibraryclasses #指定不去忽略非公共的库类
#-dontpreverify #不预校验
#-dontwarn #不警告
#-verbose
#-optimizations !code/simplification/arithmetic,!field/*,!class/merging/* #优化配置
#-dontoptimize #不优化
#-ignorewarnings #忽略警告
#
#-keep class !me.ele.**
#
## 保留签名，解决泛型、类型转换的问题
##-keepattributes Signature
#-keepattributes Exceptions
### 不混淆带有 annotation 的变量 和 函数
#-keepattributes *Annotation*
#-renamesourcefileattribute SourceFile
#-keepattributes SourceFile,LineNumberTable
#
#-allowaccessmodification
#-repackageclasses com.zxc.ccc
#
#-keepclassmembers,allowoptimization enum * {
#      public static **[] values();
#      public static ** valueOf(java.lang.String);
#}
#
#-keepclassmembers class * implements java.io.Serializable {
#    static final long serialVersionUID;
#    private static final java.io.ObjectStreamField[] serialPersistentFields;
#    !static !transient <fields>;
#    !private <fields>;
#    !private <methods>;
#    private void writeObject(java.io.ObjectOutputStream);
#    private void readObject(java.io.ObjectInputStream);
#    java.lang.Object writeReplace();
#    java.lang.Object readResolve();
#}
#
#-keep class !me.ele.mess.** implements android.os.Parcelable {
#    public static final android.os.Parcelable$Creator *;
#}
#
##-keep class me.ele.mess.TestService$InnerService {
##   *;
##}
#

#---------------------------test------------------------#
# To enable ProGuard in your project, edit project.properties
# to define the proguard.config property as described in that file.
#
# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in ${sdk.dir}/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the ProGuard
# include property in project.properties.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
#����Ҫ�� ����ele��activity������ʧЧ
-dontshrink
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers
-allowaccessmodification
-dontoptimize
-dontpreverify
-ignorewarnings
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
#-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable
#�Զ��������ָ������ ׽�Բ�
-repackageclasses poa.vew.tvj

-keep class !me.ele.mess.**

-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable
#-obfuscationdictionary dict.txt
#-classobfuscationdictionary dict.txt
#-packageobfuscationdictionary dict_def.txt

# Keep all native methods, their classes and any classes in their descriptors
-keepclasseswithmembers,includedescriptorclasses class com.tencent.mmkv.** {
    native <methods>;
    long nativeHandle;
    private static *** onMMKVCRCCheckFail(***);
    private static *** onMMKVFileLengthError(***);
    private static *** mmkvLogImp(...);
    private static *** onContentChangedByOuterProcess(***);
}

-keepclasseswithmembernames class * {  # 保持 native 方法不被混淆
    native <methods>;
}

-keep public class com.tencent.bugly.**{*;}

-keepattributes InnerClasses

-dontwarn android.support.**
-keep class android.support.** { *; }
-keep class **.R$* {*;}
#-keep class **.WebViewActivity$* {*;}

-dontwarn android.support.annotation.Keep
-dontwarn androidx.annotation.Keep
-keepclassmembers class *{
    @androidx.annotation.Keep <fields>;
    @androidx.annotation.Keep <methods>;
}

#mob
-dontwarn com.mob.**
-dontwarn cn.sharesdk.**
-keep class com.mob.**{ *; }
-keep class cn.sharesdk.** { *; }

#BASE64
-dontwarn Decoder.**
-keep class Decoder.**{ *; }

#tencent imsdk
-keep class com.tencent.**{*;}
-dontwarn com.tencent.**

-keep class tencent.**{*;}
-dontwarn tencent.**

-keep class qalsdk.**{*;}
-dontwarn qalsdk.**

-keep class com.qq.**{*;}
-dontwarn com.qq.**

#txug
-keep class com.thoughtworks.**{*;}
-dontwarn com.thoughtworks.**


#picasso
-dontwarn com.squareup.picasso.**
-keep class com.squareup.** { *; }

-dontwarn com.umeng.**
-dontwarn u.aly.**


-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}

-keep class com.umeng.**{ *; }
-keep class u.aly.**{ *; }
-keep class com.uc.** {*;}
-keep class com.efs.** {*;}

-dontwarn com.nostra13.universalimageloader.**
-keep class com.nostra13.universalimageloader.**{ *; }

#-keep class m.framework.**{ *; }
#-dontwarn m.framework.**


#--alipay
-keep class com.alipay.**{ *; }
-keep class com.ta.utdid2.**{ *; }
-keep class com.ut.device.**{ *; }
-keep class org.json.alipay.**{ *; }
-dontwarn com.alipay.**
-dontwarn com.ta.utdid2.**
-dontwarn com.ut.device.**
-dontwarn org.json.alipay.**

##---------------Begin: proguard configuration for Gson ----------
-keep public class com.google.gson.**
-keep public class com.google.gson.** {public private protected *;}

-keepclassmembers class me.ele.mess.entity.** implements java.io.Serializable {*;}
-keepclassmembers class me.ele.mess.entity.** implements android.os.Parcelable {*;}
#-keepclassmembers class me.ele.mess.entity.**{ *; }

-keepattributes Signature
#-keep public class me.ele.mess.entity.** { *; }

##---------------End: proguard configuration for Gson ----------

##---------------Begin: okgo ----------
#okhttp
-dontwarn okhttp3.**
-keep class okhttp3.**{*;}

#okio
-dontwarn okio.**
-keep class okio.**{*;}

-dontwarn com.lzy.okgo.**
-keep class com.lzy.okgo.**{*;}
##---------------End: okgo ----------

##---------------Begin: apache.http ----------
#-dontwarn android.net.**
#-keep class android.net.**{*;}
#-dontwarn com.android.**
#-keep class com.android.**{*;}
#-dontwarn org.apache.**
#-keep class org.apache.**{*;}
##---------------apache.http ----------

##-------------Begin:takePhoto-------------
-keep class com.jph.takephoto.** { *; }
-dontwarn com.jph.takephoto.**

-keep class com.darsh.multipleimageselect.** { *; }
-dontwarn com.darsh.multipleimageselect.**

-keep class com.soundcloud.android.crop.** { *; }
-dontwarn com.soundcloud.android.crop.**

-keep class me.shaohui.advancedluban.** { *; }
-dontwarn me.shaohui.advancedluban.**

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
##-------------End:takePhoto-------------

##---------------Begin: rxjava rxandroid ----------
-dontwarn io.reactivex.**
-keep class io.reactivex.**{*;}

-dontwarn org.reactivestreams.**
-keep class org.reactivestreams.**{*;}
##---------------End: rxjava rxandroid ----------

##---------------Begin: photoview ----------
-dontwarn uk.co.senab.photoview.**
-keep class uk.co.senab.photoview.**{*;}
##---------------End: photoview ----------

##---------------Begin: ���� ----------
-dontwarn com.netease.**
-keep class com.netease.** {*;}
##---------------End: ���� ----------

#AnchorClient libthrift
-keepattributes *JavascriptInterface*
-keepclassmembers class me.ele.mess.util.H5JavascriptInterface {
   public *;
}
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
#cocos
-dontwarn org.cocos2dx.**
-keep class org.cocos2dx.** {*;}
#-keep interface com.luhu.** {*;}
-keep class com.loopj.** { *; }
-dontwarn com.loopj.**
-dontwarn com.android.vending.**
-keep class com.android.vending.**{*;}
-dontwarn cz.msebera.**
-keep class cz.msebera.**{*;}

#baidu
-dontwarn com.baidu.**
-keep class com.baidu.** {*;}
#umengpush
-dontwarn com.taobao.**
-dontwarn anet.channel.**
-dontwarn anetwork.channel.**
-dontwarn org.android.**
-dontwarn org.apache.thrift.**
-dontwarn com.xiaomi.**
-dontwarn com.huawei.**

#����
-keep class com.ishumei.** { *; }

-keep class com.taobao.** {*;}
-keep class org.android.** {*;}
-keep class anet.channel.** {*;}
-keep class com.xiaomi.** {*;}
-keep class com.huawei.** {*;}
-keep class org.apache.thrift.** {*;}

-dontwarn com.alibaba.sdk.**
-keep class com.alibaba.sdk.android.**{*;}
-keep class com.ut.**{*;}
-keep class com.ta.**{*;}

-keep public class **.R$*{
   public static final int *;
}
-dontwarn com.appsflyer.**
-keep class com.appsflyer.**{*;}
-dontwarn com.google.**
-keep class com.google.** {*;}
#a Li
-keep class com.alibaba.livecloud.** { *;}
-keep class com.alivc.** { *;}
-dontwarn  com.alivc.**

-keep class com.alivc.player.**{*;}
-keep class com.aliyun.clientinforeport.**{*;}
-dontwarn com.alivc.player.**

-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# Only required if you use AsyncExecutor
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}


#����
-keep class io.agora.**{*;}

-keep class com.gyf.immersionbar.* {*;}
 -dontwarn com.gyf.immersionbar.**

 -keep class com.faceunity.wrapper.faceunity {*;}
 -keep class com.faceunity.wrapper.faceunity$RotatedImage {*;}

 -dontwarn com.bumptech.glide.**
 -keep class com.bumptech.glide.**{*;}
 -keep public class * implements com.bumptech.glide.module.GlideModule
 -keep public class * extends com.bumptech.glide.module.AppGlideModule
 -keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
   **[] $VALUES;
   public *;
 }

 -keep class com.google.android.material.** {*;}

 -keep class androidx.** {*;}
#
# -keep public class * extends androidx.**
#
 -keep interface androidx.** {*;}
#
 -dontwarn com.google.android.material.**

 -dontnote com.google.android.material.**


-keepattributes Signature
-dontwarn com.alibaba.fastjson.**
-keep class com.alibaba.fastjson.**{*; }

#
# -dontwarn androidx.**

#=====================================================

#-dontwarn sun.misc.**
#-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
#   long producerIndex;
#   long consumerIndex;
#}
#-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
#    rx.internal.util.atomic.LinkedQueueNode producerNode;
#}
#-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
#    rx.internal.util.atomic.LinkedQueueNode consumerNode;
#}

#-keep public class * extends android.view.View {
#    public <init>(android.content.Context);
#    public <init>(android.content.Context, android.util.AttributeSet);
#    public <init>(android.content.Context, android.util.AttributeSet, int);
#    public void set*(***);
#    *** get* ();
#}
-keep class com.zhihu.matisse.**
-keep class !me.ele.mess.** implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}


-keepclassmembers class * {
    @me.ele.mess.KeepMethod <methods>;
}

