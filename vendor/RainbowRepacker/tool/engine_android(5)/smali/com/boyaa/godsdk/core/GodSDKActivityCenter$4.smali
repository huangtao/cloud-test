.class Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;
.super Ljava/lang/Object;
.source "GodSDKActivityCenter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->requestSwitchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

.field private final synthetic val$activityCenter:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;->val$activityCenter:Ljava/lang/String;

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 192
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 193
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 194
    const v1, 0xebf0

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 195
    const-string v1, "\u5207\u6362\u670d\u52a1\u5668\u5931\u8d25"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 196
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;->this$0:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->access$0(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;)Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    move-result-object v1

    .line 197
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;->val$activityCenter:Ljava/lang/String;

    .line 196
    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/ActivityCenterListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 198
    return-void
.end method
