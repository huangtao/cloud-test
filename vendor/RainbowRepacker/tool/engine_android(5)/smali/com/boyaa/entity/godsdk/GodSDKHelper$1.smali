.class Lcom/boyaa/entity/godsdk/GodSDKHelper$1;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/SDKListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 180
    const-string v0, "gaojie"

    const-string v1, "godSdk onInitFailed"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public onInitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 175
    const-string v0, "gaojie"

    const-string v1, "godSdk onInitSuccess"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public onQuitCancel(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$0(Lcom/boyaa/entity/godsdk/GodSDKHelper;Z)V

    .line 171
    return-void
.end method

.method public onQuitSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$1;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$0(Lcom/boyaa/entity/godsdk/GodSDKHelper;Z)V

    .line 165
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->finish()V

    .line 166
    return-void
.end method
