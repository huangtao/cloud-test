.class Lcom/boyaa/util/SmsUtil$3;
.super Landroid/content/BroadcastReceiver;
.source "SmsUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/SmsUtil;->onSendSms(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/util/SmsUtil$SendSmsCallBack;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cb:Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/boyaa/util/SmsUtil$SendSmsCallBack;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/util/SmsUtil$3;->val$cb:Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

    iput-object p2, p0, Lcom/boyaa/util/SmsUtil$3;->val$context:Landroid/content/Context;

    .line 115
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "_context"    # Landroid/content/Context;
    .param p2, "_intent"    # Landroid/content/Intent;

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/boyaa/util/SmsUtil$3;->getResultCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 129
    :pswitch_0
    iget-object v0, p0, Lcom/boyaa/util/SmsUtil$3;->val$cb:Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

    invoke-interface {v0}, Lcom/boyaa/util/SmsUtil$SendSmsCallBack;->sendFailed()V

    .line 133
    :goto_0
    iget-object v0, p0, Lcom/boyaa/util/SmsUtil$3;->val$context:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 134
    return-void

    .line 121
    :pswitch_1
    iget-object v0, p0, Lcom/boyaa/util/SmsUtil$3;->val$cb:Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

    invoke-interface {v0}, Lcom/boyaa/util/SmsUtil$SendSmsCallBack;->sendSuccesfully()V

    goto :goto_0

    .line 126
    :pswitch_2
    iget-object v0, p0, Lcom/boyaa/util/SmsUtil$3;->val$cb:Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

    invoke-interface {v0}, Lcom/boyaa/util/SmsUtil$SendSmsCallBack;->sendFailed()V

    goto :goto_0

    .line 118
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
