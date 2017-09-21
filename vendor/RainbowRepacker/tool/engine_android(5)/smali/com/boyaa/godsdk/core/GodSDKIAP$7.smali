.class Lcom/boyaa/godsdk/core/GodSDKIAP$7;
.super Ljava/lang/Object;
.source "GodSDKIAP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

.field private final synthetic val$main:I

.field private final synthetic val$msg:Ljava/lang/String;

.field private final synthetic val$sub:I


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKIAP;IILjava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iput p2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$main:I

    iput p3, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$sub:I

    iput-object p4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$msg:Ljava/lang/String;

    .line 394
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 398
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 399
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    iget v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$main:I

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 400
    iget v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$sub:I

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 401
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 402
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$0(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/callback/IAPListener;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/IAPListener;->onPayFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 403
    return-void
.end method
