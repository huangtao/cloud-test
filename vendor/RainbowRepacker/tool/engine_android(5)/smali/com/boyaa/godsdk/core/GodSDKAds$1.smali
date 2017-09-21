.class Lcom/boyaa/godsdk/core/GodSDKAds$1;
.super Ljava/lang/Object;
.source "GodSDKAds.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKAds;->preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKAds;

.field private final synthetic val$adsChannel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKAds$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKAds;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKAds$1;->val$adsChannel:Ljava/lang/String;

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 119
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 120
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const v1, 0xc670

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 121
    const/4 v1, -0x4

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 122
    const-string v1, "\u9884\u52a0\u8f7d\u5e7f\u544a\u7cfb\u7edf\u5931\u8d25\uff0cGodSDK\u672a\u521d\u59cb\u5316"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 123
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKAds$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKAds;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKAds;->access$0(Lcom/boyaa/godsdk/core/GodSDKAds;)Lcom/boyaa/godsdk/callback/AdsListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds$1;->val$adsChannel:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 124
    return-void
.end method
