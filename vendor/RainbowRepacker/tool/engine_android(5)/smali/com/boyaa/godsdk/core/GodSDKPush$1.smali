.class Lcom/boyaa/godsdk/core/GodSDKPush$1;
.super Ljava/lang/Object;
.source "GodSDKPush.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKPush;->addAlias(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKPush;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 216
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 217
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const v1, 0x9ca4

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 218
    const v1, 0x9ca5

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 219
    const-string v1, "\u4e0d\u652f\u6301\u6dfb\u52a0\u522b\u540d"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 220
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKPush;->access$0(Lcom/boyaa/godsdk/core/GodSDKPush;)Lcom/boyaa/godsdk/callback/PushListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKPush;->getPushName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/PushListener;->onAddAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 221
    return-void
.end method
