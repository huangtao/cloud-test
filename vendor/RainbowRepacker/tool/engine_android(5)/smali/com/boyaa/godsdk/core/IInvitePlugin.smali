.class public interface abstract Lcom/boyaa/godsdk/core/IInvitePlugin;
.super Ljava/lang/Object;
.source "IInvitePlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getDefaultInviteChannel()Ljava/lang/String;
.end method

.method public abstract getSupportingInviteChannels()Ljava/util/Set;
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

.method public abstract invite(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract invite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setInviteListener(Lcom/boyaa/godsdk/callback/InviteListener;)V
.end method
