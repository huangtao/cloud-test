.class public interface abstract Lcom/boyaa/godsdk/core/ISDKPlugin;
.super Ljava/lang/Object;
.source "ISDKPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/IQuitRequired;


# virtual methods
.method public abstract getVersionCode()I
.end method

.method public abstract getVersionName()Ljava/lang/String;
.end method

.method public varargs abstract initSDK(Landroid/app/Activity;Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;[Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator",
            "<",
            "Ljava/lang/Integer;",
            ">;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation
.end method

.method public abstract release(Landroid/app/Activity;)V
.end method

.method public abstract setSDKListener(Lcom/boyaa/godsdk/callback/SDKListener;)V
.end method
