.class public interface abstract Lcom/boyaa/godsdk/core/ISharePlugin;
.super Ljava/lang/Object;
.source "ISharePlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract authorize(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract authorize(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract followFriend(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract followFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract getDefaultShareChannel()Ljava/lang/String;
.end method

.method public abstract getSupportingShareChannels()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUserInfo(Landroid/app/Activity;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUserInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract listFriend(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract listFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setShareListener(Lcom/boyaa/godsdk/callback/ShareListener;)V
.end method

.method public abstract share(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract share(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method
