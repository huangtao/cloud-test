.class Lcom/boyaa/godsdk/core/GodSDKShare$10;
.super Ljava/lang/Object;
.source "GodSDKShare.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKShare;->requestFollowFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKShare;

.field private final synthetic val$shareChannel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKShare$10;->this$0:Lcom/boyaa/godsdk/core/GodSDKShare;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKShare$10;->val$shareChannel:Ljava/lang/String;

    .line 414
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 418
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 419
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 420
    const v1, 0x11238

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 421
    const-string v1, "\u5173\u6ce8\u597d\u53cb\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 422
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKShare$10;->this$0:Lcom/boyaa/godsdk/core/GodSDKShare;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKShare;->access$0(Lcom/boyaa/godsdk/core/GodSDKShare;)Lcom/boyaa/godsdk/callback/ShareListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare$10;->val$shareChannel:Ljava/lang/String;

    .line 423
    const/4 v3, 0x6

    .line 422
    invoke-interface {v1, v0, v2, v3}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    .line 424
    return-void
.end method
