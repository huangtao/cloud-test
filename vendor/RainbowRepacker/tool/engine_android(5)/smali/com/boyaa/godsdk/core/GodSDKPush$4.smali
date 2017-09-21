.class Lcom/boyaa/godsdk/core/GodSDKPush$4;
.super Ljava/lang/Object;
.source "GodSDKPush.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKPush;->removeAlias(Landroid/content/Context;Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 291
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 292
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const v1, 0x9d6c

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 293
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 294
    const-string v1, "\u53bb\u9664\u522b\u540d\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 295
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKPush;->access$0(Lcom/boyaa/godsdk/core/GodSDKPush;)Lcom/boyaa/godsdk/callback/PushListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKPush;->getPushName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/PushListener;->onRemoveAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 296
    return-void
.end method
