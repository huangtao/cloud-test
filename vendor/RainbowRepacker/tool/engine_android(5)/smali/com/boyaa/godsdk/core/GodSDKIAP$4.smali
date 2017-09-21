.class Lcom/boyaa/godsdk/core/GodSDKIAP$4;
.super Ljava/lang/Object;
.source "GodSDKIAP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKIAP;->requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

.field private final synthetic val$pmode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$4;->val$pmode:Ljava/lang/String;

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 156
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 157
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v1, 0x4e84

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 158
    const/4 v1, -0x3

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 159
    const-string v1, "\u652f\u4ed8\u9700\u8981\u767b\u5f55\uff0c\u4f46\u672a\u767b\u5f55"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKIAP;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->access$0(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/callback/IAPListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP$4;->val$pmode:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/IAPListener;->onPayFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 161
    return-void
.end method
