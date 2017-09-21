.class public interface abstract Lcom/boyaa/godsdk/core/IAdsPlugin;
.super Ljava/lang/Object;
.source "IAdsPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getDefaultAdsChannel()Ljava/lang/String;
.end method

.method public abstract getSupportingAdsChannels()Ljava/util/Set;
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

.method public abstract hideAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract hideAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract preloadAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract preloadAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract queryPoints(Ljava/lang/String;)F
.end method

.method public abstract setAdsListener(Lcom/boyaa/godsdk/callback/AdsListener;)V
.end method

.method public abstract showAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract showAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end method

.method public abstract showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
.end method

.method public abstract spendPoints(Ljava/lang/String;I)V
.end method
