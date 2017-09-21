.class public Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;
.super Ljava/lang/Object;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkType"
.end annotation


# instance fields
.field private volatile isRegistered:Z

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 501
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 482
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    .line 503
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;

    invoke-direct {v0, p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;)V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    .line 533
    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 2

    .prologue
    .line 495
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->isRegistered:Z

    if-eqz v0, :cond_0

    .line 496
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 497
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->isRegistered:Z

    .line 499
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 486
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 487
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 488
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 489
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 490
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->isRegistered:Z

    .line 492
    .end local v0    # "intentFilter":Landroid/content/IntentFilter;
    :cond_0
    return-void
.end method
