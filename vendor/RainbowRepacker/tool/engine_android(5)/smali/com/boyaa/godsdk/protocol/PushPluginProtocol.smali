.class public interface abstract Lcom/boyaa/godsdk/protocol/PushPluginProtocol;
.super Ljava/lang/Object;
.source "PushPluginProtocol.java"


# virtual methods
.method public abstract addAlias(Landroid/content/Context;Ljava/lang/String;Lcom/boyaa/godsdk/callback/PushListener;)V
.end method

.method public abstract getPushName()Ljava/lang/String;
.end method

.method public abstract getRegistrationId(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract isSupportAddAlias()Z
.end method

.method public abstract isSupportRemoveAlias()Z
.end method

.method public abstract isSupportRemovetTags()Z
.end method

.method public abstract isSupportSetTags()Z
.end method

.method public abstract removeAlias(Landroid/content/Context;Ljava/lang/String;Lcom/boyaa/godsdk/callback/PushListener;)V
.end method

.method public abstract removeTags(Landroid/content/Context;Ljava/util/List;Lcom/boyaa/godsdk/callback/PushListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/boyaa/godsdk/callback/PushListener;",
            ")V"
        }
    .end annotation
.end method

.method public abstract setTags(Landroid/content/Context;Ljava/util/List;Lcom/boyaa/godsdk/callback/PushListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/boyaa/godsdk/callback/PushListener;",
            ")V"
        }
    .end annotation
.end method

.method public abstract turnOffPush(Landroid/content/Context;)V
.end method

.method public abstract turnOnPush(Landroid/content/Context;)V
.end method
