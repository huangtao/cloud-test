.class public interface abstract Lcom/boyaa/godsdk/core/IActivityCenterPlugin;
.super Ljava/lang/Object;
.source "IActivityCenterPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract displayActivityCenter(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract displayActivityCenter(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract forcePushing(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract forcePushing(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract getDefaultActivityCenter()Ljava/lang/String;
.end method

.method public abstract getNumOfActivity(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract getNumOfActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract getSupportingActivityCenters()Ljava/util/Set;
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

.method public abstract setActivityCenterListener(Lcom/boyaa/godsdk/callback/ActivityCenterListener;)V
.end method

.method public abstract switchServer(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract switchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method
