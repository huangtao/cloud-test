.class public Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;
.super Landroid/os/Handler;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 450
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 453
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 476
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 477
    return-void

    .line 455
    :pswitch_1
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;

    iget-object v3, v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;->title:Ljava/lang/String;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;

    iget-object v1, v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;->message:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->showDialog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 458
    :pswitch_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 459
    const-string v2, "message"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 460
    const-string v2, "device not support!"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 461
    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 462
    const-string v2, "ok"

    new-instance v3, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler$1;

    invoke-direct {v3, p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 468
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 469
    .local v0, "alertDialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 472
    .end local v0    # "alertDialog":Landroid/app/Dialog;
    :pswitch_3
    invoke-static {p1}, Lcom/boyaa/engine/made/AppHttpGet;->HandleTimeout(Landroid/os/Message;)V

    goto :goto_0

    .line 453
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
