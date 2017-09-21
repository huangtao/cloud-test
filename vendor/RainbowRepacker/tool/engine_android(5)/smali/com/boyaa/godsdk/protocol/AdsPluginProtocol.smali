.class public interface abstract Lcom/boyaa/godsdk/protocol/AdsPluginProtocol;
.super Ljava/lang/Object;
.source "AdsPluginProtocol.java"


# virtual methods
.method public abstract getAdsChannel()Ljava/lang/String;
.end method

.method public abstract hideAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsMode;Lcom/boyaa/godsdk/callback/AdsListener;)V
.end method

.method public abstract preloadAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsMode;Lcom/boyaa/godsdk/callback/AdsListener;)V
.end method

.method public abstract queryPoints()F
.end method

.method public abstract showAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsMode;Lcom/boyaa/godsdk/callback/AdsListener;)V
.end method

.method public abstract spendPoints(I)V
.end method
