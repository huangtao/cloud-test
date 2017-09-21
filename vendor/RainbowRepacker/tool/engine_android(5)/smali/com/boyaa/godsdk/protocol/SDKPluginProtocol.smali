.class public interface abstract Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
.super Ljava/lang/Object;
.source "SDKPluginProtocol.java"


# virtual methods
.method public abstract getActivityLifeCycleListener()Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
.end method

.method public abstract getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract initSDK(Landroid/app/Activity;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SDKListener;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/boyaa/godsdk/callback/SDKListener;",
            ")Z"
        }
    .end annotation
.end method

.method public abstract isQuitRequired()Z
.end method

.method public abstract quit(Landroid/app/Activity;Lcom/boyaa/godsdk/callback/SDKListener;)V
.end method

.method public abstract release(Landroid/app/Activity;)V
.end method
