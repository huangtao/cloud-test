.class Lcom/boyaa/godsdk/core/GodSDK$2;
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
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK$2;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    .line 433
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 437
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 438
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 439
    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 440
    const-string v1, "GodSDK\u7248\u672c\u53f7\u914d\u7f6e\u4e0d\u6b63\u786e"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 441
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK$2;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/boyaa/godsdk/callback/SDKListener;->onInitFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 442
    return-void
.end method
