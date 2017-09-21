.class Lcom/boyaa/godsdk/core/GodSDKInvite$1;
.super Ljava/lang/Object;
.source "GodSDKInvite.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKInvite;->invite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKInvite;

.field private final synthetic val$inviteChannel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKInvite;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKInvite$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKInvite;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKInvite$1;->val$inviteChannel:Ljava/lang/String;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 78
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 79
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const v1, 0x13948

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 80
    const/4 v1, -0x4

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 81
    const-string v1, "\u9080\u8bf7\u5931\u8d25\uff0cGodSDK\u672a\u521d\u59cb\u5316"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 82
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKInvite$1;->this$0:Lcom/boyaa/godsdk/core/GodSDKInvite;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKInvite;->access$0(Lcom/boyaa/godsdk/core/GodSDKInvite;)Lcom/boyaa/godsdk/callback/InviteListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKInvite$1;->val$inviteChannel:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/InviteListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 83
    return-void
.end method
