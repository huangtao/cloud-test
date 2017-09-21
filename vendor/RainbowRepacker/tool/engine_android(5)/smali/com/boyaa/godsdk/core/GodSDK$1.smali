.class Lcom/boyaa/godsdk/core/GodSDK$1;
.super Ljava/lang/Object;
.source "GodSDK.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/SDKListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/core/GodSDK;
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
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDK$1;)Lcom/boyaa/godsdk/core/GodSDK;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    return-object v0
.end method


# virtual methods
.method public onInitFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 269
    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->access$0()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v0

    const-string v1, "\u771f\u5b9e\u7b2c\u4e09\u65b9SDK \u521d\u59cb\u5316\u5931\u8d25"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 271
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK$1$2;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/godsdk/core/GodSDK$1$2;-><init>(Lcom/boyaa/godsdk/core/GodSDK$1;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 278
    :cond_0
    return-void
.end method

.method public onInitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 256
    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->access$0()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v0

    const-string v1, "\u771f\u5b9e\u7b2c\u4e09\u65b9SDK \u521d\u59cb\u5316\u6210\u529f"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 257
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 258
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK$1$1;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/godsdk/core/GodSDK$1$1;-><init>(Lcom/boyaa/godsdk/core/GodSDK$1;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 265
    :cond_0
    return-void
.end method

.method public onQuitCancel(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 299
    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->access$0()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v0

    const-string v1, "\u771f\u5b9e\u7b2c\u4e09\u65b9SDK \u9000\u51fa\u53d6\u6d88"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 300
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK$1$4;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/godsdk/core/GodSDK$1$4;-><init>(Lcom/boyaa/godsdk/core/GodSDK$1;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 307
    return-void
.end method

.method public onQuitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 282
    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->access$0()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v0

    const-string v1, "\u771f\u5b9e\u7b2c\u4e09\u65b9SDK \u9000\u51fa\u6210\u529f"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->access$2(Lcom/boyaa/godsdk/core/GodSDK;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/boyaa/godsdk/core/GodSDK;->access$3(Lcom/boyaa/godsdk/core/GodSDK;I)V

    .line 285
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;
    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->access$4(Lcom/boyaa/godsdk/core/GodSDK;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK$1;->this$0:Lcom/boyaa/godsdk/core/GodSDK;

    # getter for: Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->access$2(Lcom/boyaa/godsdk/core/GodSDK;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 286
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK$1$3;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/godsdk/core/GodSDK$1$3;-><init>(Lcom/boyaa/godsdk/core/GodSDK$1;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 295
    :cond_0
    return-void
.end method
