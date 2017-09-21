.class Lcom/boyaa/godsdk/core/GodSDKAccount$3;
.super Ljava/lang/Object;
.source "GodSDKAccount.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKAccount;

.field private final synthetic val$loginTag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKAccount$3;->this$0:Lcom/boyaa/godsdk/core/GodSDKAccount;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount$3;->val$loginTag:Ljava/lang/String;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 111
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 112
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v1, 0x2774

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 113
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 114
    const-string v1, "\u8bf7\u6c42\u767b\u5f55\u53d1\u751f\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 115
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKAccount$3;->this$0:Lcom/boyaa/godsdk/core/GodSDKAccount;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->access$0(Lcom/boyaa/godsdk/core/GodSDKAccount;)Lcom/boyaa/godsdk/callback/AccountListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount$3;->val$loginTag:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/AccountListener;->onLoginFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 116
    return-void
.end method
