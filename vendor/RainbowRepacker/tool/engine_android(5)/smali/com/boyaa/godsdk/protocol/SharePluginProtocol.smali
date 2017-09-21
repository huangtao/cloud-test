.class public interface abstract Lcom/boyaa/godsdk/protocol/SharePluginProtocol;
.super Ljava/lang/Object;
.source "SharePluginProtocol.java"


# virtual methods
.method public abstract authorize(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/ShareListener;)V
.end method

.method public abstract followFriend(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/ShareListener;)V
.end method

.method public abstract getShareChannel()Ljava/lang/String;
.end method

.method public abstract getUserInfo(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/ShareListener;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Lcom/boyaa/godsdk/callback/ShareListener;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract listFriend(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/ShareListener;)V
.end method

.method public abstract share(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/ShareListener;)V
.end method
