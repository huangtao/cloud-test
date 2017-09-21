.class public interface abstract Lcom/boyaa/godsdk/protocol/LocationPluginProtocol;
.super Ljava/lang/Object;
.source "LocationPluginProtocol.java"


# virtual methods
.method public abstract getLocation(Landroid/app/Activity;)Ljava/lang/String;
.end method

.method public abstract getLocationChannel()Ljava/lang/String;
.end method

.method public abstract startLocate(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/callback/LocationListener;)V
.end method

.method public abstract stopLocate(Landroid/app/Activity;Lcom/boyaa/godsdk/callback/LocationListener;)V
.end method
