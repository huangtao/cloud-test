.class Lcom/boyaa/godsdk/core/GodSDK$3;
.super Ljava/lang/Object;
.source "GodSDK.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDK;->initPluginInfo(Landroid/app/Activity;[Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDK;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDK;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK$3;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    .line 491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 495
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 496
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 497
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 498
    const-string v1, "GodSDK\u521d\u59cb\u5316\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 499
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK$3;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/boyaa/godsdk/callback/SDKListener;->onInitFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 500
    return-void
.end method
