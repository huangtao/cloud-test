.class Lcom/boyaa/util/SmsUtil$1;
.super Ljava/lang/Object;
.source "SmsUtil.java"

# interfaces
.implements Lcom/boyaa/util/SmsUtil$SendSmsCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/SmsUtil;->sendSms(Landroid/app/Activity;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public sendCancel()V
    .locals 2

    .prologue
    .line 67
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/util/SmsUtil$1$2;

    invoke-direct {v1, p0}, Lcom/boyaa/util/SmsUtil$1$2;-><init>(Lcom/boyaa/util/SmsUtil$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 74
    return-void
.end method

.method public sendFailed()V
    .locals 2

    .prologue
    .line 78
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/util/SmsUtil$1$3;

    invoke-direct {v1, p0}, Lcom/boyaa/util/SmsUtil$1$3;-><init>(Lcom/boyaa/util/SmsUtil$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 84
    return-void
.end method

.method public sendSuccesfully()V
    .locals 2

    .prologue
    .line 57
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/util/SmsUtil$1$1;

    invoke-direct {v1, p0}, Lcom/boyaa/util/SmsUtil$1$1;-><init>(Lcom/boyaa/util/SmsUtil$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 63
    return-void
.end method
