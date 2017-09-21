.class public interface abstract Lcom/boyaa/godsdk/core/ILocationPlugin;
.super Ljava/lang/Object;
.source "ILocationPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getDefaultLocationChannel()Ljava/lang/String;
.end method

.method public abstract getLocation(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getSupportingLocationChannels()Ljava/util/Set;
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

.method public abstract setLocationListener(Lcom/boyaa/godsdk/callback/LocationListener;)V
.end method

.method public abstract startLocate(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract startLocate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract stopLocate(Landroid/app/Activity;)V
.end method

.method public abstract stopLocate(Landroid/app/Activity;Ljava/lang/String;)V
.end method
